class Perspectives::CommentsController < ApplicationController

  def model_instances
    Perspective.find(params[:id]).comments
  end

end
