class InitialStates::ScoopsController < ApplicationController

  def show
  end

  def model_instance_preload
    { facts: { comments: :comments, user: nil }, perspectives: { comments: :comments, user: nil } }
  end

end
