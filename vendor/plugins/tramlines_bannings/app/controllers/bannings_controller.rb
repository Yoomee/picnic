class BanningsController < ApplicationController

  admin_only :create, :destroy
  
  def create
    @banning = Banning.new(params[:banning])
    @banning.save!
    update_view
  end
  
  def destroy
    @banning = Banning.find(params[:id])
    @banning.destroy
    update_view
  end
  
  private
  def update_view
    render :update do |page|
      page << "$.fancybox.close();"
      page[:ban].replace :partial => 'members/ban', :locals => {:member => @banning.member}
      page << "FancyboxLoader.loadAll();"
    end
  end
  
end