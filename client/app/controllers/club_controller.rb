class ClubController< ApplicationController
  
  def index
    if logged_out?
      return render(:template => "club/logged_out_index.html.haml")
    end
  end
  
end