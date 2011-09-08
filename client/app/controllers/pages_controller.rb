PagesController.class_eval do

  before_filter :handle_facelist, :only => [:create, :update]
  before_filter :get_latest_story, :only => [:show]
  cache_sweeper :page_sweeper
  
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
  
  def get_latest_story
    if !@page.section.slug_is?(:stories) && stories_section = Section.find_by_slug(:stories)
      @latest_story = stories_section.pages.latest.first
    end
  end
  
end