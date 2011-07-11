PagesController.class_eval do

  before_filter :handle_facelist, :only => [:create, :update]
  
  def show_with_contact_form
    show_without_contact_form
    if @page.slug == 'beta'
      @enquiry = Enquiry.new(:form_name => 'Beta', :member => logged_in_member) if @page.slug == 'beta'
      spamify(@enquiry)
    end
  end
  alias_method_chain :show, :contact_form
  
  private
  def handle_facelist
    params[:page] ||= {}
    params[:page][:tag_list] = params[:facelist_values_page_themes] if !params[:facelist_values_page_themes].nil?
  end
  
end