class Facts::CommentsController < ApplicationController

  def model_instances
    Fact.find(params[:id]).comments
  end

end
