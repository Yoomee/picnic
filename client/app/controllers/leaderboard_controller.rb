class LeaderboardController < ApplicationController
  
  before_filter :get_points_transfers
  
  def index
    @ranked_members = Member.ranked_since(1.month.ago).active
    @top_posters = Member.top_posters_since(1.month.ago).active
    #@top_tags = Tag.top_tags_since(1.month.ago).limit(15)
    @top_tags = @template.trending_tags_including_conference(10)
    paginate_and_render
  end
  
  def all_time
    @ranked_members = Member.ranked.active
    @top_posters = Member.top_posters.active
    #@top_tags = Tag.top_tags.limit(15)
    @top_tags = @template.top_tags_including_conference(10)
    paginate_and_render
  end
  
  private
  def get_points_transfers
    @points_transfers = PointsTransfer.latest.for_active_members.limit(18)
  end
  
  def paginate_and_render
    # manually calculate total_entries because of bug with using count method along with group by
    total_ranked_members = @ranked_members.count(:select => "DISTINCT members.id")
    # Limit to 5 pages (using limit named_scope doesn't seem to work)
    total_ranked_members = total_ranked_members > 50 ? 50 : total_ranked_members
    @ranked_members = @ranked_members.paginate(:per_page => LeaderboardController::RANKED_MEMBERS_PER_PAGE, :page => params[:ranking_page], :total_entries => total_ranked_members)
    if request.xhr? && params[:ranking_page]
      render(:partial => "leaderboard/top_people", :locals => {:members => @ranked_members})
    else
      total_top_posters = @top_posters.count(:select => "DISTINCT members.id")
      # Limit to 5 pages (using limit named_scope doesn't seem to work)
      total_top_posters = total_top_posters > 40 ? 40 : total_top_posters
      @top_posters = @top_posters.paginate(:per_page => 8, :page => params[:posters_page], :total_entries => total_top_posters)
      if request.xhr? && params[:posters_page]
        render(:partial => "leaderboard/top_posters", :locals => {:members => @top_posters})
      else
        render :action => "index"
      end
    end
  end
  
end
LeaderboardController::RANKED_MEMBERS_PER_PAGE = 10