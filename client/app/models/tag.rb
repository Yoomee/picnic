require "erb"
class Tag < ActsAsTaggableOn::Tag
  
  include ERB::Util

  # TODO: Make urls look nicer e.g. Urban%2520planning -> Urban-planning
  def to_param
    u(name)
  end
  
end