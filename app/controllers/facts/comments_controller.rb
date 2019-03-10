class Facts::CommentsController < ApplicationController

  def comments
    Fact.find(params[:id]).comments
  end

end
