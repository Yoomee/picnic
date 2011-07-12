Section.class_eval do
  
  acts_as_taggable_on :tags
  
  Section::VIEW_OPTIONS = [
    ['First Page', 'first_page'],
    ['Index View', 'latest_stories'],
    ['News View', 'news_view']
  ]
  
  def color
    tags.color_not_null.first.try(:color) || '#C9DCDF'
  end
  
  def flip_partial
    "page_section"
  end
  
end