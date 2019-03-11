class ApplicationController < ActionController::API

  before_action :set_model_instance, only: %i[ show edit create update destroy ]
  before_action :set_model_instances, only: %i[ index ]

  def index
    render json: model_instances.map(&:whitelisted_attributes)
  end

  def show
    render json: model_instance.whitelisted_attributes
  end

  def create
    model_instance.assign_attributes(model_params)
    if model_instance.save
      render(json: { success: true, errors: [], resource: model_instance.whitelisted_attributes) }
    else
      render(json: { success: false, errors: model_instance.erros.full_messages }, status: 400)
    end
  end

  private

  def model_name
    controller_name.classify.downcase
  end

  def model
    model_name.capitalize.constantize
  end

  def generate_model_instance
    case params[:action]
    when *%w[ show edit update destroy ]
      model.find(params[:id])
    when *%w[ new create ]
      model.new
    end
  end

  def generate_model_instances
    model.all
  end

  def model_instance
    instance_variable_get("@#{model.member_name}")
  end

  def model_instances
    instance_variable_get("@#{model.collection_name}")
  end

  def set_model_instance
    instance_variable_set("@#{model.member_name}", generate_model_instance)
  end

  def set_model_instances
    instance_variable_set("@#{model.collection_name}", generate_model_instances)
  end

  def model_params
    params.require(model_name).permit(*permitted_model_columns)
  end


end
