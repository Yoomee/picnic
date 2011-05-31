HomeController.class_eval do
  
  def close_beta_bar
    cookies[:hide_beta_bar] = true
    render :update do |page|
      page << "$('#beta_bar').fadeOut()"
    end
  end
  
end