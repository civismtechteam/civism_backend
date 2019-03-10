class ApplicationController < ActionController::API

  before_action :set_model_instance, only: %i[ show edit create update destroy ]
  before_action :set_model_instances, only: %i[ index ]

  def self.inherited(controller)
    controller.define_method controller.controller_name.classify.downcase do
      case params[:action]
      when *%w[ show edit update destroy ]
        model.find(params[:id])
      when *%w[ new create ]
        model.new
      end
    end

    controller.define_method controller.controller_name.classify.downcase.pluralize do
      model.all
    end
  end

  def index
    render json: model_instances.map(&:whitelisted_attributes)
  end

  def show
    render json: model_instance.whitelisted_attributes
  end

  def create
    if !respond_to?("permitted_#{model_name}_columns")
      raise("no permitted_#{model_name}_columns method defined on #{model_name.capitalize} model")
    end
    model_instance.assign_attributes(model_params)
    if instance.save
      render(json: model_instance.whitelisted_attributes)
    else
      rendor(json: { errors: model_instance.erros.full_messages }, status: 400)
    end
  end

  private

  def model_instance
    send(model_name)
  end

  def model_instances
    send(model_name.pluralize)
  end

  def set_model_instance
    instance_variable_set("@#{model.member_name}", model_instance)
  end

  def set_model_instances
    instance_variable_set("@#{model.collection_name}", model_instances)
  end

  def model_name
    controller_name.classify.downcase
  end

  def model
    model_name.capitalize.constantize
  end

end
