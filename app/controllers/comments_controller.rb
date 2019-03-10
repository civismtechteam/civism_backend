class CommentsController < ApplicationController

   def permitted_comment_columns
     %i[ body ]
   end

end
