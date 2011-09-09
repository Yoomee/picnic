RatingsController.class_eval do
  
  private
  def update_page
    render :update do |page|
      if @rating.save!
        unique_rating = unique_rating_string(@rating)
        case
        when @rating.rateable.is_a?(Page)
          page["like_form_#{unique_rating}"].replace(like_form(@rating, :polarized => false, :allow_unlike => false, :ajax_loader => "ajax_loader_arrows.gif", :disable_if_logged_out => true))
        when Module.value_to_boolean(params[:polarized])
          page["#like_form_#{unique_rating} .like_links"].replace_html(like_and_dislike_links(@rating))
        when !params[:allow_unlike].blank? && !Module.value_to_boolean(params[:allow_unlike])
          page["#like_form_#{unique_rating} .like_links"].replace_html(like_link(@rating))
        else
          page["#like_form_#{unique_rating} .like_links"].replace_html(unlike_link(@rating))
        end
        page["#like_list_#{unique_rating}"].replace(render_like_list_for(@rating.rateable))        
        update_like_counts_for(@rating.rateable, page)
      end
    end
  end
  
end