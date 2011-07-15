SearchController.class_eval do
  
  def create
    options = {:match_mode => params[:match_mode], :autocomplete => params[:autocomplete], :page => params[:page], :per_page => SearchController::PER_PAGE, :models => %w{Member Page Section Shout WallPost}}
    @search_filter = params[:search_filter]
    @search = Search.new params[:search], options
    if request.xhr?
      partial_view_path = params[:results_view_path] ? "#{params[:results_view_path]}/" : ""
      return render(:partial => "#{partial_view_path}ajax_search_results", :locals => {:search => @search})
    end
  end
  
  def index
    @search = Search.new
    render :action => "create"
  end
  
end
SearchController::PER_PAGE = 10