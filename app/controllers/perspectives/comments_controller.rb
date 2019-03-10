class Perspectives::CommentsController < ApplicationController

  def comments
    Perspective.find(params[:id]).comments
  end

end
