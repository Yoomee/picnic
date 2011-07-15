class FrontCoversController < ApplicationController
  
  admin_only :activate, :create, :deactivate, :destroy, :edit, :index, :new, :show, :update

  before_filter :get_front_cover, :only => %w{edit show update destroy activate deactivate}
  
  def activate
    @front_cover.activate!
    redirect_to_waypoint
  end
  
  def create
    @front_cover = FrontCover.new(params[:front_cover])
    if @front_cover.save
      flash[:notice] = 'New front cover successfully created'
      redirect_to @front_cover
    else
      render :action => 'new'
    end
  end
   
  def deactivate
    @front_cover.deactivate!
    flash[:notice] = 'This front cover has now been deactivated. The default front cover page will be shown instead'
    redirect_to_waypoint
  end
  
  def destroy
    @front_cover.destroy
    redirect_to front_covers_path
  end
  
  def edit
  end
  
  def index
    @front_covers = FrontCover.latest
  end
  
  def new
    @front_cover = Factory.build(:default_front_cover)
  end
  
  def show
  end
  
  def update
    if @front_cover.update_attributes(params[:front_cover])
      flash[:notice] = 'Front cover successfully updated'
      redirect_to_waypoint
    else
      render :action => 'edit'
    end
  end
    
  private
  def get_front_cover
    @front_cover = FrontCover.find(params[:id])   
  end
  
end

unless Factory.factories.keys.include?(:default_front_cover)
  Factory.define(:default_front_cover, :class => FrontCover) do |f|
    f.main_story_small_heading 'PICNIC FESTIVAL 2011'
    f.main_story_title 'Presenting Adam Greenfield'
    f.main_story_subtitle 'Founder and managing director, Urbanscale'
    f.main_story_text "Adam Greenfield is founder and managing director of urban systems design practice Urbanscale LLC. Author of Everyware: The dawning age of ubiquitous computing (2006), the forthcoming The City Is Here For You To Use and, with Mark Shepard, co-author of the inaugural Situated Technologies pamphlet Urban Computing and its Discontents (2007), Adam was previously Nokia's head of design direction for service and user interface. He lives and works in New York City with his wife, artist Nurri Kim."
    f.main_story_link_url '/adam-greenfield'
    f.small_story1_title 'Speakers'
    f.small_story1_text 'Look who else is talking at PICNIC Festival 2011.'
    f.small_story1_link_url '/picnic11-speakers'
    f.small_story2_title 'Festival'
    f.small_story2_text 'Who will be there, workshops, labs and what great food will be served.'
    f.small_story2_link_url '/welcome-1'
    f.small_story3_title 'Join the club!'
    f.small_story3_text "Meet and mingle will all people and speakers attending the festival? Get access to people and unique content"
    f.small_story3_link_text 'Join Now!'
    f.small_story3_link_url '/club'
  end
end