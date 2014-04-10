module TramlinesBannings::ApplicationControllerExtensions
  
  def self.included(klass)
    klass.before_filter(:check_banning)
  end

  private
  def check_banning
    if logged_in_member.try(:banned?)
      flash.discard
      logout_member!(:call_method => 'render_banned')
    end
  end
  
  def render_banned
    @banning = logged_in_member.banning
    @logged_in_member = nil
    render(:template => 'home/banned')
  end
  
end