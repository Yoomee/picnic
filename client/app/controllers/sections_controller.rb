SectionsController.class_eval do
  
  def show
    case @section.view
    when 'latest_stories', 'news_view'
      @pages_sections = @section.pages.published.latest + @section.children
      @pages_sections.extend(SectionsController::SortByWeightAndPublished)
      @pages_sections = @pages_sections.sort_by_weight_and_published.paginate(
        :page => params[:page],
        :per_page => (@section.view == 'news_view' ? 7 : (APP_CONFIG[:latest_stories_items_per_page] || 6))
      )
      render :action => @section.view
    when 'first_page'
      redirect_to send("#{@section.destination_type}_path", @section.destination) unless @section.destination == @section
    else
      # Otherwise use show view
      @pages = @section.pages.published.weighted.paginate(:page => params[:page], :per_page => (APP_CONFIG[:section_pages_items_per_page] || 10))
    end
  end
  
  
  
  module SortByWeightAndPublished

    def compare_weight_and_published(item_a, item_b)
      weight_comp = item_a.weight <=> item_b.weight
      return weight_comp unless weight_comp.zero?
      item_b.publish_on <=> item_a.publish_on
    end

    def sort_by_weight_and_published
      sort do |item_a, item_b|
        compare_weight_and_published(item_a, item_b)
      end
    end

  end
  
end