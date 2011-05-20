class TagsController < ApplicationController
  
  before_filter :get_tag, :only => %w{destroy edit show update}

  def autocomplete
    search_term = params[:term].downcase.gsub('_', ' ').gsub(/[^A-Za-z\d\-\s]/, '').strip
    term_list = [*search_term.gsub('-', ' ').split]
    if term_list.size < 2
      tags = Tag.named_like(term_list.join(" ")).limit(5)
    else
      tags = Tag.named_like(search_term)
      if tags.size < 5
        term_list.each do |term|
          tags += Tag.named_like(term).limit(5 - tags.size) if term.length >= 3
          break if tags.size >= 5
        end
      end
    end
    tags_list = tags.uniq.collect {|t| {:name => t.name.downcase, :value => t.name.downcase}}
    if term_list.size > 2
      tags_list << {:name => "<em>Please use fewer words to describe this theme.</em>", :value => ""}
    elsif search_term.length > 25
      tags_list << {:name => "<em>Please use less than 25 characters.</em>", :value => ""}
    else
      tags_list << {:name => "<em>Click here to add the new theme:</em> #{search_term}", :value => search_term} unless tags_list.collect(&:values).flatten.include?(search_term)
    end
    render :json => tags_list
  end


  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      flash[:notice] = "New theme has been created"
      redirect_to @tag
    else
      render :action => "new"
    end
  end

  def destroy
    if @tag.destroy
      flash[:notice] = "#{@tag} theme has been deleted"
    else
      flash[:error] = "#{@tag} theme could not be deleted"
    end
    redirect_to_waypoint
  end
  
  def edit
    
  end
  
  def index
    @tags = Tag.all
  end
  
  def new
    @tag = Tag.new
  end
  
  def show
    @stories = Shout.tagged_with(params[:id]).all.paginate(:per_page => 6, :page => params[:page])
  end
  
  def update
    if @tag.update_attributes(params[:tag])
      flash[:notice] = "Updated theme"
      redirect_to @tag
    else
      render :action => "edit"
    end
  end
  
  private
  def get_tag
    @tag = Tag.find_by_name(CGI::unescape(params[:id]))
  end
  
end