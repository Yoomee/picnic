TagsController.class_eval do

  skip_before_filter :check_what_i_bring, :only => %w{autocomplete}

  before_filter :get_tag, :only => %w{destroy edit older_shouts people show stories update}

  admin_only :edit, :new, :create, :destroy, :update

  cache_sweeper :tag_sweeper

  def autocomplete
    search_term = params[:term].downcase.gsub('_', ' ').gsub(/[^A-Za-z\d\-\s]/, '').strip
    term_list = [*search_term.gsub('-', ' ').split]
    if term_list.size < 2
      tags = Tag.named_like(term_list.join(" ")).limit(5)
    else
      tags = Tag.named_like(search_term)
      if tags.size < 5
        term_list.each do |term|
          tags += Tag.named_like(term).limit(5 - tags.size) if term.length >= 3
          break if tags.size >= 5
        end
      end
    end
    tags_list = tags.uniq.collect {|t| {:name => t.name.downcase, :value => t.name.downcase}}
    if term_list.size > 2
      tags_list << {:name => "<em>Please use fewer words to describe this theme.</em>", :value => ""}
    elsif search_term.length > 25
      tags_list << {:name => "<em>Please use less than 25 characters.</em>", :value => ""}
    else
      tags_list << {:name => "<em>Click here to add the new theme:</em> #{search_term}", :value => search_term} unless tags_list.collect(&:values).flatten.include?(search_term)
    end
    render :json => tags_list
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      flash[:notice] = "New theme has been created"
      redirect_to @tag
    else
      render :action => "new"
    end
  end

  def destroy
    if @tag.destroy
      flash[:notice] = "#{@tag} theme has been deleted"
    else
      flash[:error] = "#{@tag} theme could not be deleted"
    end
    redirect_to_waypoint
  end

  def edit

  end

  def index
    @tags = Tag.top_tags_since(1.month.ago).all
  end

  def new
    @tag = Tag.new
  end

  def older_shouts
    @shouts = get_shouts.paginate(:page => params[:page], :per_page => params[:per_page])
    render :update do |page|
      @shouts.each do |shout|
        page.insert_html :bottom, :shout_wall, render_shout(shout)
      end
      if WillPaginate::ViewHelpers.total_pages_for_collection(@shouts) > params[:page].to_i
        page << "$('#older_shouts_link').attr('onclick', '').unbind('click');"
        page << "$('#older_shouts_link').click(function() {#{remote_function(:url => older_shouts_link_url(:parent => @tag, :filter => @filter), :method => :get)}; return false;});"
      else
        page[:older_shouts_link].replace("")
      end
    end
  end


  def people
    @members = Member.with_theme_or_member_tag(@tag)
  end

  def show
    if !@tag.blank?
      if request.xhr? && params[:wants] == 'shouts'
        shouts = get_shouts
        if shouts.empty?
          render :text => @template.not_posted_yet_message(@member)
        else
          render :text => @template.render_shouts(shouts, :filter => @filter, :parent => @tag) + @template.javascript_tag(@template.refresh_fb_dom)
        end
      else
        @shouts = Shout.tagged_with(@tag)
        @stories = Page.latest.tagged_with(@tag).select {|page| page.published? && page.root_section_slug == 'stories'}
        @members = Member.with_theme_or_member_tag(@tag)
      end
    else
      redirect_to tags_path 
    end
  end
  
  def stories
    @stories = Page.latest.tagged_with(@tag).select {|page| page.published? && page.root_section_slug == 'stories'}
  end

  def update
    if @tag.update_attributes(params[:tag])
      flash[:notice] = "Updated theme"
      redirect_to @tag
    else
      render :action => "edit"
    end
  end

  private
  def get_shouts
    @filter = params[:filter]
    case @filter
    when 'popular'
      Shout.tagged_with(params[:id]).top_rated
    when 'latest'
      Shout.tagged_with(params[:id])
    end
  end

  def get_tag
    @tag = Tag.find_by_name(CGI::unescape(params[:id]))
  end


end
