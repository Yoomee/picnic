class ClubController< ApplicationController

  def connections
  end
  
  def index
    if logged_out?
      return render(:template => "club/logged_out_index.html.haml")
    end
  end
  
  def leaderboard
  end
  
end