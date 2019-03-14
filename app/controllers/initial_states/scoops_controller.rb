class InitialStates::ScoopsController < ApplicationController

  def show
  end

  def model_instance_preload
    { facts: { comments: :comments }, perspectives: { comments: :comments } }
  end

end
