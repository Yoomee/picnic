MembersController.class_eval do
  
  admin_only :admin
  open_actions :show, :index

  skip_before_filter :check_what_i_bring, :only => %w{update what_i_bring me}
  skip_badge_announcement :what_i_bring
  
  member_only :what_i_bring

  def change_password_with_picnic
    @member.skip_what_i_bring_validation = true
    change_password_without_picnic
  end
  alias_method_chain :change_password, :picnic
  
  def admin
    @members = Member.alphabetically.paginate(:per_page => 20, :page => params[:page])
    sign_up_counts = Member.created_at_gte(2.months.ago).count(:id, :group => "DATE(created_at)")
    @data = []
    (2.months.ago.to_date..Date.today).each do |date|
      @data << [date.strftime("%d/%m/%y"), sign_up_counts[date.to_s].to_i]
    end
  end
  
  def index
    @latest_members = Member.latest
    @find_someone_members = Member.with_what_i_bring.with_image.random.limit(4)
  end

  def new_with_redirect
    if logged_in_member && !logged_in_member_is_admin?
      login_member!(logged_in_member)
    else
      new_without_redirect
      spamify(@member)
      @member.conference_delegate_id ||= session[:conference_delegate_id]
    end
  end
  alias_method_chain :new, :redirect
  
  def older_shouts
    get_member
    @shouts = get_shouts.paginate(:page => params[:page], :per_page => params[:per_page])
    render :update do |page|
      @shouts.each do |shout|
        page.insert_html :bottom, :shout_wall, render_shout(shout)
      end
      if WillPaginate::ViewHelpers.total_pages_for_collection(@shouts) > params[:page].to_i
        page << "$('#older_shouts_link').attr('onclick', '').unbind('click');"
        page << "$('#older_shouts_link').click(function() {#{remote_function(:url => older_shouts_link_url(:parent => @member, :filter => @filter), :method => :get)}; return false;});"
      else
        page[:older_shouts_link].replace("")
      end
    end
  end

  def show_with_shout_filtering
    if request.xhr? && params[:wants] == 'shouts'
      shouts = get_shouts
      if shouts.empty?
        render :text => (@filter == 'received' ? @template.not_received_yet_message(@member) : @template.not_posted_yet_message(@member))
      else
        render :text => @template.render_shouts(shouts, :parent => @member, :filter => @filter) + @template.javascript_tag(@template.refresh_fb_dom)
      end
    else
      if @member.banned? && admin_logged_in?
        flash.now[:notice] = "This member is currently banned"
      end
      show_without_shout_filtering
    end
  end
  alias_method_chain :show, :shout_filtering

  def update
    params[:member] ||= {}
    params[:member][:tag_list] = params[:facelist_values_member_themes] if !params[:facelist_values_member_themes].nil?
    @member.update_attributes(params[:member])
    respond_to do |format|
      format.html do
        if @member.valid?
          flash[:notice] = "Profile updated"
          redirect_to params[:redirect_to] || @member
        else
          render :action => (params[:member].keys.map(&:to_s) == ['what_i_bring'] ? 'what_i_bring' : 'edit')
        end
      end
      format.js do
        ajax_update_response(@member, params[:wants], params[:sf])
      end
      format.text do
        ajax_update_response(@member, params[:wants], params[:sf])
      end
    end
  end

  def what_i_bring
    @member = logged_in_member
  end

  private
  def get_shouts
    @filter = params[:filter]
    case @filter
    when 'popular'
      @member.recipientless_shouts.top_rated
    when 'latest'
      @member.recipientless_shouts
    when 'received'
      @member.received_shouts
    end
  end
  
end
