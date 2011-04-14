HomeController.class_eval do
  
  def index
    @what_we_do_section = Section.slug(:what_we_do, :parent => Section.slug(:our_work))
    @latest_blog_posts = Blog.main.posts.latest
  end
  
end