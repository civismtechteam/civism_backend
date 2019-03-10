class Scoops::PerspectivesController < ApplicationController

  def perspectives
    Scoop.find(params[:id]).perspectives
  end

end
