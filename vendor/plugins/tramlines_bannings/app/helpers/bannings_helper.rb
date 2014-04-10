module BanningsHelper
  
  def render_ban_link(member)
    render("members/ban", :member => member)
  end
  
end