class ApplicationController < ActionController::API

  before_action :set_model_instance, only: %i[ show edit update destroy ]
  before_action :set_model_instances, only: %i[ index ]

  def model_instance
    case params[:action]
    when *%w[ show edit update destroy ]
      model.find(params[:id])
    when *%w[ new create ]
      model.new
    end
  end

  def model_instances
    model.all
  end

  def set_model_instance
    instance_variable_set("@#{model.member_name}", model_instance)
  end

  def set_model_instances
    instance_variable_set("@#{model.collection_name}", model_instances)
  end

  def index
    render json: instance_variable_get("@#{model.collection_name}").map(&:whitelisted_attributes)
  end

  def show
    render json: instance_variable_get("@#{model.member_name}").whitelisted_attributes
  end

  private

  def model_name
    controller_name.classify
  end

  def model
    model_name.constantize
  end

end
