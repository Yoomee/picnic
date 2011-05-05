class CorrespondentsController < ApplicationController
  
  def index
    @correspondents = Member.with_badge(:correspondent).all
  end
  
end