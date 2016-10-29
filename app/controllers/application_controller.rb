class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fetch_parent

private

  def fetch_parent_models
    @laboratory = Laboratory.find(params[:laboratory_id]) if params[:laboratory_id]
    @experiment = Experiment.find(params[:experiment_id]) if params[:experiment_id]
  end
end
