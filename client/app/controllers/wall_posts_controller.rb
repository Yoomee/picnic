WallPostsController::HELP_MESSAGE = "Add comment"
WallPostsController.class_eval do

  super_only :destroy
  owner_only :remove, :restore
  
  def show
    @wall_post = WallPost.find params[:id]
    redirect_to shout_path(@wall_post.attachable, :anchor => "reply#{@wall_post.id}")
  end
  
  def remove
    @wall_post = WallPost.find(params[:id])
    render :update do |page|
      if @wall_post.update_attributes(:removed_by => @logged_in_member, :removed_at => Time.now)
        page["#wall_post_#{@wall_post.id}"].replace(render("walls/post", :post => @wall_post))
        page.visual_effect :highlight, "wall_post_#{@wall_post.id}"
        page << "FancyboxLoader.loadAll()"
      end
    end
  end

  def restore
    render :update do |page|
      @wall_post = WallPost.find(params[:id])
      if @wall_post.update_attributes(:removed_by => nil, :removed_at => nil)
        page["#wall_post_#{@wall_post.id}"].replace(render("walls/post", :post => @wall_post))
        page.visual_effect :highlight, "wall_post_#{@wall_post.id}"
        page << "FancyboxLoader.loadAll()"
      end
    end
  end
  
  def update
    @wall_post = WallPost.find params[:id]
    if params[:wall_post]
      render(:update) do |page|
        if @wall_post.update_attributes(params[:wall_post])
          if Module.value_to_boolean(params[:in_moderation])
            page["moderation_right_inner"].replace_html(render("content_flags/content_flag", :content_flag => @wall_post.content_flag))
          else
            page["#wall_post_#{@wall_post.id} .reply_body p"].replace_html(@wall_post.text)
            page.visual_effect :highlight, "wall_post_#{@wall_post.id}"
          end
          page << "$.fancybox.close();"
          page << "FancyboxLoader.loadAll();"
        else
          page[:edit_wall_post_form].replace render("wall_posts/edit", :wall_post => @wall_post)
          page << "$.fancybox.resize();"
        end
      end
    else
      if params[:value].blank?
        render :text => @wall_post.text
      else
        @wall_post.text = params[:value]
        @wall_post.save
        render :text => params[:value]
      end
    end
  end
  
end