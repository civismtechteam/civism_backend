class CommentsController < ApplicationController

   def permitted_model_columns
     %i[ body user_id ] # TODO: remove user_id
   end

end
