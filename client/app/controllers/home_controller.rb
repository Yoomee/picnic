HomeController.class_eval do
  
  def index
    @section = Section.slug(:news_network)
  end
  
end