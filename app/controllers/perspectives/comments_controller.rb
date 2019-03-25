class Perspectives::CommentsController < CommentsController

  def generate_model_instances
    Perspective.find(params[:id]).comments
  end

end
