module ClientHelper
  
  def viewing_club?
    current_page?(club_path) || current_page?(new_member_path)
  end
  
end