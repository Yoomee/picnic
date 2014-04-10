class BadgesController < ApplicationController
  
  admin_only :new, :create, :edit, :update, :award, :awarded, :unawarded, :remove
  
  def award
    @member, @badge = Member.find(params[:member_id]), Badge.find(params[:id])
    if !@member.has_badge?(@badge)
      @member.badges << @badge
      if @member.save
        flash[:notice] =  "Awarded #{@member} the #{@badge} badge"
      else
        flash[:error] =  "Failed to award #{@member} the #{@badge} badge"
      end
    else
      flash[:error] =  "#{@member} already has the #{@badge} badge"
    end
    redirect_to @member
  end
  
  def remove
    @member, @badge = Member.find(params[:member_id]), Badge.find(params[:id])
    if @member.has_badge?(@badge)
      @member.badges.delete(@badge)
      if @member.save
        flash[:notice] =  "Removed the #{@badge} badge from #{@member}"
      else
        flash[:error] =  "Failed to remove the #{@badge} badge from #{@member}"
      end
    else
      flash[:error] =  "#{@member} doesn't have the #{@badge} badge"
    end
    redirect_to @member
  end
  
  def info
    @badge = Badge.find(params[:id])
    render :layout => false
  end
  
  def awarded
    @member = Member.find(params[:member_id])
    @badges = @member.badges
    render :layout => false
  end
  
  def unawarded
    @member = Member.find(params[:member_id])
    @badges = Badge.all - @member.badges
    render :layout => false
  end
  
  def new
    @badge = Badge.new
  end
  
  def create
    @badge = Badge.new(params[:badge])
    if @badge.save
      flash[:notice] = "Created a new badge"
      redirect_to badge_path(@badge)
    else
      render "new"
    end
  end
  
  def edit
    @badge = Badge.find(params[:id])
  end
  
  def update
    @badge = Badge.find(params[:id])
    if @badge.update_attributes(params[:badge])
      flash[:notice] = "Badge successfully updated."
      redirect_to badge_path(@badge)
    else
      render "edit"
    end
  end
  
  def show
    @badge = Badge.find(params[:id])
    @badge_members = @badge.members.paginate(:page => params[:page], :per_page => 30, :order => "forename ASC")
  end
  
  def index
    @badges = Badge.ascend_by_name
  end

end