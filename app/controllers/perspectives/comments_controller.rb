class Perspectives::CommentsController < ApplicationController

  def generate_model_instances
    Perspective.find(params[:id]).comments
  end

end
