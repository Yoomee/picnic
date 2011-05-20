class ClubController< ApplicationController

  def connections
  end
  
  def discussions
  end
  
  def index
    if logged_out?
      return render(:template => "club/logged_out_index.html.haml")
    end
    @latest_members = Member.latest
    @find_someone_members = Member.with_what_i_bring.with_image.random.limit(4)
  end
  
  def leaderboard
  end
  
end