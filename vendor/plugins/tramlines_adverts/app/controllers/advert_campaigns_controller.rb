class AdvertCampaignsController < ApplicationController

  admin_only :create, :destroy, :edit, :index, :new, :show, :update

  def create
    @campaign = AdvertCampaign.new(params[:advert_campaign])
    if @campaign.save
      flash[:notice] = "Created campaign."
      redirect_to @campaign
    else
      render :action => "new"
    end
  end

  def destroy
    @campaign = AdvertCampaign.find(params[:id])
    if @campaign.destroy
      flash[:notice] = "Campaign has been deleted."
      redirect_to advert_campaigns      
    else
      flash[:error] = "Could not delete campaign."
      redirect_to_waypoint
    end
  end

  def edit
    @campaign = AdvertCampaign.find(params[:id])
  end
  
  def index
    @campaigns = AdvertCampaign.find(:all, :order => "name ASC")
  end
  
  def new
    @campaign = AdvertCampaign.new
  end
  
  def show
    @campaign = AdvertCampaign.find(params[:id])
    render :template => "adverts/index"
  end
  
  def update
    @campaign = AdvertCampaign.find(params[:id])
    if @campaign.update_attributes(params[:advert_campaign])
      flash[:notice] = "Updated campaign."
      redirect_to @campaign
    else
      render :action => "edit"
    end
  end
  
end