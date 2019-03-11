class Facts::VotesController < ApplicationController

  def model_params
    super.merge(voteable_type: "Fact", voteable_id: params[:id])
  end

  def permitted_model_columns
    %i[ direction user_id ] # TODO: remove user_id
  end

end
