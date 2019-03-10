class Scoops::FactsController < ApplicationController

  def facts
    Scoop.find(params[:id]).facts
  end

end
