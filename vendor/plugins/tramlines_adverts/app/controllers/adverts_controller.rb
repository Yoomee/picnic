class AdvertsController < ApplicationController

  admin_only :create, :destroy, :edit, :index, :new, :show, :update

  def click
    @advert = Advert.find(params[:id])
    @advert.increment!(:click_count)
    redirect_to @advert.url
  end

  def create
    @advert = Advert.new(params[:advert])
    if @advert.save
      flash[:notice] = "Created advert."
      redirect_to @advert
    else
      render :action => "new"
    end
  end

  def destroy
    @advert = Advert.find(params[:id])
    if @advert.destroy
      flash[:notice] = "Advert has been deleted."
      redirect_to @advert.campaign
    else
      flash[:error] = "Could not delete advert."
      redirect_to_waypoint
    end
  end

  def edit
    @advert = Advert.find(params[:id])
  end
  
  def index
    @advert = Advert.find(:all, :order => "name ASC")
  end
  
  def new
    @advert = Advert.new(:campaign_id => params[:advert_campaign_id])
  end
  
  def show
    @advert = Advert.find(params[:id])
  end
  
  def update
    @advert = Advert.find(params[:id])
    if @advert.update_attributes(params[:advert])
      flash[:notice] = "Updated advert."
      redirect_to @advert
    else
      render :action => "edit"
    end
  end
  
end