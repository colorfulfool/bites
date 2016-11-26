class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :fetch_parent_resource

  helper_method :current_laboratory

  include Authentication

  def current_laboratory
    @laboratory || @experiment&.laboratory
  end

  rescue_from CanCan::AccessDenied do |exception|
    session[:next] = request.path
    redirect_to new_session_path
  end

private

  def fetch_parent_resource
    @laboratory = Laboratory.find(params[:laboratory_id]) if params[:laboratory_id]
    @experiment = Experiment.find(params[:experiment_id]) if params[:experiment_id]
  end
end
