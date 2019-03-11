class Comments::VotesController < ApplicationController

  def model_params
    super.merge(voteable_type: "Comment", voteable_id: params[:id])
  end

  def permitted_model_columns
    %i[ direction user_id ] # TODO: remove user_id
  end

end
