SectionsController.class_eval do

  def show
    if @section.view == "latest_stories"
      @pages_sections = @section.pages + @section.children
      @pages_sections = @pages_sections.sort_by(&:weight).paginate(:page => params[:page], :per_page => (APP_CONFIG[:latest_stories_items_per_page] || 6))
      render :action => 'latest_stories'
    else
      redirect_to page_path(@section.first_page) unless @section.pages.empty?
    end
  end

end