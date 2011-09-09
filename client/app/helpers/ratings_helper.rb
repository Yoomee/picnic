RatingsHelper.module_eval do
  
  def render_like_link_for_with_picnic(rateable, options = {})
    puts "logged_out? = #{logged_out?}"
    puts "options[:disable_if_logged_out] = #{options[:disable_if_logged_out]}"
    puts "rateable.is_a?(Page) = #{rateable.is_a?(Page)}"
    if logged_out? && options[:disable_if_logged_out] && rateable.is_a?(Page) && !rateable.likings_count_string.blank?
      content_tag(:span, :class => 'disabled_with_rating') do
        render_like_link_for_without_picnic(rateable, options) + content_tag(:span, rateable.likings_count_string, :class => "likings_count #{rateable.been_liked? ? '' : 'no_ratings'}", :id => "likings_count_#{unique_rating_string(rateable)}")
      end
    else
      render_like_link_for_without_picnic(rateable, options)
    end
  end
  alias_method_chain :render_like_link_for, :picnic
  
end
      
  