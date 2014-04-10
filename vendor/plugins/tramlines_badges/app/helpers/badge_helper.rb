module BadgeHelper

  def badge_trigger_options
    Member.badge_triggers.keys.collect do |trigger|
      [trigger.to_s.titleize.downcase, trigger.to_s]
    end
  end
  
  def skip_badge_announcement?
    logged_out? || @skip_badge_announcement
  end
  
  def render_badge_announcement
    return "" if !logged_in? || skip_badge_announcement?
    badge_awardings = @logged_in_member.badge_awardings.not_announced
    badge_awardings.each {|awarding| awarding.update_attribute(:announced, true)}
    @unannounced_badges = badge_awardings.collect(&:badge)
    return "" if @unannounced_badges.blank?
    badge_announcement_fancybox_javascript(@unannounced_badges)
  end
  
  def badge_announcement_fancybox_javascript(badges)
    javascript_tag do
      "$(document).ready(function(){
        $.fancybox(
          '#{escape_javascript(render("badges/announce", :badges => badges))}',
          {
          'autoDimensions':false,
          'width':600,
          'height':360,
          'transitionIn':'none',
          'transitionOut':'none',
          'centerOnScroll': true
          }
        );
      });"
    end
  end
  
end