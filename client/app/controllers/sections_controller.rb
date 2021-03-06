module SectionsController::SortByWeightAndPublished

  def compare_weight_and_published(item_a, item_b)
    weight_comp = item_a.weight <=> item_b.weight
    return weight_comp unless weight_comp.zero?
    return 0 if !item_a.respond_to?(:publish_on) || !item_b.respond_to?(:publish_on)
    item_b.publish_on <=> item_a.publish_on
  end

  def compare_published(item_a, item_b)
    return 0 if !item_a.respond_to?(:publish_on) || !item_b.respond_to?(:publish_on)
    item_b.publish_on <=> item_a.publish_on
  end

  def sort_by_weight_and_published
    sort do |item_a, item_b|
      compare_weight_and_published(item_a, item_b)
    end
  end

  def sort_by_published
    sort do |item_a, item_b|
      compare_published(item_a, item_b)
    end
  end

end

SectionsController.class_eval do

  before_filter :handle_facelist, :only => [:create, :update]

  def home
    #return home_from_site if request.referrer =~ /localhost|picnicnetwork/
    if !show_splash_page? && ((@front_cover = front_cover) || (@section = home_section))
      if @front_cover && !params[:show_carousel]
        # Do nothing
        render "home/front_cover"
      else
        @show_flipboard = true
        # # Redirect to festival news
        # return redirect_to("/#{@section.permalink_name}")
        # case @section.view
        # when 'latest_stories', 'news_view'
        #   @pages_sections = @section.pages.published.latest + @section.children
        #   @pages_sections.extend(SectionsController::SortByWeightAndPublished)
        #   @pages_sections = @pages_sections.sort_by_weight_and_published.paginate(
        #   :page => params[:page],
        #   :per_page => (@section.view == 'news_view' ? 7 : (APP_CONFIG[:latest_stories_items_per_page] || 6))
        #   )
        #   render :action => @section.view
        # when 'first_page'
        #   @page = @section.destination
        #   render :template => "pages/show"
        # else
        #   # Otherwise use show view
        #   @pages = @section.pages.published.weighted.paginate(:page => params[:page], :per_page => (APP_CONFIG[:section_pages_items_per_page] || 10))
        #   render :action => 'show'
        # end
      end
    else
      seen_splash_page!
      render :template => 'home/index'
    end
  end

  def show
    # if @section.slug == 'news' && !params[:archive] && @page = @section.pages.published.latest.first
    #   render :template => 'pages/show'
    # else
      case @section.view
      when 'latest_stories', 'news_view'
        if @section.slug_is(:news)
          per_page_amount = 20
        elsif @section.view == "news_view"
          per_page_amount = (@section.slug == "network_partners" || (@section.parent.try(:slug) =~ /^sponsors/)) ? 1000 : 6
        else
          per_page_amount = APP_CONFIG[:latest_stories_items_per_page] || 6         
        end
        @pages_sections = @section.pages.published.latest + @section.children.not_hidden
        @pages_sections.extend(SectionsController::SortByWeightAndPublished)
        @pages_sections = @pages_sections.sort_by_weight_and_published.paginate(
        :page => params[:page],
        :per_page => per_page_amount
        )
        render :action => @section.view
      when 'first_page'
        redirect_to send("#{@section.destination_type}_path", @section.destination) unless @section.destination == @section
      else
        # Otherwise use show view
        @pages = @section.pages.published.weighted.paginate(:page => params[:page], :per_page => (APP_CONFIG[:section_pages_items_per_page] || 10))
      end
    # end
  end


  private
  def front_cover
    FrontCover.active.first
  end
  
  def handle_facelist
    params[:section] ||= {}
    params[:section][:tag_list] = params[:facelist_values_section_themes] if !params[:facelist_values_section_themes].nil?
  end

  def home_from_site
    destination = Section.find_by_slug('about_us').destination
    if destination.is_a?(Section)
      @section = destination
      return show
    else
      @page = destination
      if !@page.section.slug_is?(:stories) && stories_section = Section.find_by_slug(:stories)
        @latest_story = stories_section.pages.latest.first
      end
      return render('pages/show')
    end
  end

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