module FrontCoversHelper
  
  def small_story_link_text(front_cover, n)
    front_cover.send("small_story#{n}_link_text")
  end
  
  def small_story_link_url(front_cover, n)
    front_cover.send("small_story#{n}_link_url")
  end
  
  def small_story_text(front_cover, n)
    front_cover.send("small_story#{n}_text")
  end
  
  def small_story_title(front_cover, n)
    front_cover.send("small_story#{n}_title")
  end
  
end
