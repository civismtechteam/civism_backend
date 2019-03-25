class Facts::VotesController < VotesController

  def success_resource
    model_instance.voteable.reload
  end

  def model_params
    super.merge(voteable_type: "Fact", voteable_id: params[:id])
  end

  def permitted_model_columns
    %i[ direction user_id ] # TODO: remove user_id
  end

end
