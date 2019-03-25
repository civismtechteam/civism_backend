class Facts::CommentsController < CommentsController

  def generate_model_instances
    Fact.find(params[:id]).comments
  end

end
