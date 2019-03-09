class Scoops::FactsController < ApplicationController

  def model_instances
    Scoop.find(params[:id]).facts
  end

end
