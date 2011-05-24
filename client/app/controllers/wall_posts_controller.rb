WallPostsController::HELP_MESSAGE = "Enter your comment..."
WallPostsController.class_eval do
  
  def show
    @wall_post = WallPost.find params[:id]
    redirect_to shout_path(@wall_post.attachable, :anchor => "reply#{@wall_post.id}")
  end
  
end