class Scoops::PerspectivesController < ApplicationController

  def generate_model_instances
    Scoop.find(params[:id]).perspectives
  end

end
