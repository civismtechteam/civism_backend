class Facts::CommentsController < ApplicationController

  def generate_model_instances
    Fact.find(params[:id]).comments
  end

end
