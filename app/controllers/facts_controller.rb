class FactsController < ApplicationController

  def permitted_model_columns
    %i[ body source_link user_id ] # TODO: remove user_id
  end

end
