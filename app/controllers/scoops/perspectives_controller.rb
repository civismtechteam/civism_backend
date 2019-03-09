class Scoops::PerspectivesController < ApplicationController

  def model_instances
    Scoop.find(params[:id]).perspectives
  end

end
