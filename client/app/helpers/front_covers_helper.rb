module FrontCoversHelper

  def picnic_color_options
    {
      "Blue (design)" => '218eb5',
      "Green (sustainability)" => '1a8035',
      "Yellow (infrastructure)" => 'c29e25',
      "Pink (society)" => 'd22467',
      "Purple (media)" => '543e80',
      "Grey (business)" => '767776',
      "Orange (academy)" => 'be5822'
    }
  end    
  
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
