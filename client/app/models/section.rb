Section.class_eval do
  
  Section::VIEW_OPTIONS = [
    ['First Page', 'first_page'],
    ['Index View', 'latest_stories'],
    ['News View', 'news_view']
  ]
  
  def flip_partial
    "page_section"
  end
  
end