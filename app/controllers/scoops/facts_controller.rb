class Scoops::FactsController < ApplicationController

  def generate_model_instances
    Scoop.find(params[:id]).facts
  end

end
