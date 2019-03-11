class Comments::CommentsController < ApplicationController

  def generate_model_instances
    Comment.find(params[:id]).comments
  end

end
