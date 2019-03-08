class ApplicationController < ActionController::API

  before_action :set_model_instance, only: %i[ show edit update destroy ]

  def set_model_instance
    instance_variable_set("@#{model.member_name}", model.find(params[:id]))
  end

  def show
    render json: set_model_instance.whitelisted_attributes
  end

  private

  def model_name
    controller_name.classify
  end

  def model
    model_name.constantize
  end

end
