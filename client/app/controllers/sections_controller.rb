module SectionsController::SortByWeightAndPublished

  def compare_weight_and_published(item_a, item_b)
    weight_comp = item_a.weight <=> item_b.weight
    return weight_comp unless weight_comp.zero?
    return 0 if !item_a.respond_to?(:publish_on) || !item_b.respond_to?(:publish_on)
    item_b.publish_on <=> item_a.publish_on
  end

  def sort_by_weight_and_published
    sort do |item_a, item_b|
      compare_weight_and_published(item_a, item_b)
    end
  end

end

SectionsController.class_eval do

  def home
    if !show_splash_page? && @section = home_section
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
        @page = @section.destination
        render :template => "pages/show"
      else
        # Otherwise use show view
        @pages = @section.pages.published.weighted.paginate(:page => params[:page], :per_page => (APP_CONFIG[:section_pages_items_per_page] || 10))
        render :action => 'show'
      end
    else
      seen_splash_page!
      render :template => 'home/index'
    end
  end

  def show
    case @section.view
    when 'latest_stories', 'news_view'
      @pages_sections = @section.pages.published.latest + @section.children
      @pages_sections.extend(SectionsController::SortByWeightAndPublished)
      @pages_sections = @pages_sections.sort_by_weight_and_published.paginate(
      :page => params[:page],
      :per_page => (@section.view == 'news_view' ? 6 : (APP_CONFIG[:latest_stories_items_per_page] || 6))
      )
      render :action => @section.view
    when 'first_page'
      redirect_to send("#{@section.destination_type}_path", @section.destination) unless @section.destination == @section
    else
      # Otherwise use show view
      @pages = @section.pages.published.weighted.paginate(:page => params[:page], :per_page => (APP_CONFIG[:section_pages_items_per_page] || 10))
    end
  end


  private

  def seen_splash_page!
    if splash_page_advert
      session[:viewed_splash_pages] ||= []
      session[:viewed_splash_pages] << splash_page_advert.id.to_s
    end
  end

  def seen_splash_page?
    session[:viewed_splash_pages] && session[:viewed_splash_pages].include?(splash_page_advert.id.to_s)
  end

  def show_splash_page?
    splash_page_advert && !seen_splash_page?
  end

end