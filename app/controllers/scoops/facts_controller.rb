class Scoops::FactsController < FactsController

  def model_params
    super.merge(scoop_id: params[:id])
  end

  def generate_model_instances
    Scoop.find(params[:id]).facts
  end

end
