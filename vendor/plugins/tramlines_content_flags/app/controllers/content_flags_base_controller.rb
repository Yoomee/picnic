class ContentFlagsBaseController < ApplicationController
  protected  
  def replace_moderation_content(partial_name, options={})
    wrapper_class = options.delete(:wrapper_class)
    if !(active_color = options.delete(:active_color))
       active_color = @content_flag_type.nil? ? "#444" : @content_flag_type.color
    end
    
    render :update do |page|
      page["moderation_right_inner"].replace_html(render(partial_name, options))
      page["moderation_sidebar"].replace(render("moderation/sidebar"))
      page << "$('#moderation_wrapper').attr('class', '#{escape_javascript(wrapper_class)}');"
      page << "FancyboxLoader.loadAll();"
      page << refresh_fb_dom if site_uses_fb_connect?
      
      if active_color
        page << "$('#moderation_right_col').css('border-color', '#{active_color}');"
      end
      
    end
  end
  
  def set_up_sidebar
    @inbox_count = ContentFlag.unresolved.count
    @content_flag_types ||= ContentFlagType.all
  end
  
end