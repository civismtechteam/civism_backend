class Scoops::FactsController < FactsController

  def generate_model_instances
    Scoop.find(params[:id]).facts
  end

end
