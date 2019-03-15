class Perspectives::VotesController < VotesController

  def model_params
    super.merge(voteable_type: "Perspective", voteable_id: params[:id])
  end

  def permitted_model_columns
    %i[ direction user_id ] # TODO: remove user_id
  end

end
