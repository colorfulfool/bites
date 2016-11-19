class ExperimentsController < ApplicationController
  before_action :set_experiment, only: [:show, :edit, :update, :destroy]

  def index
    @experiments = @laboratory.experiments
  end

  def forefront
    @experiments = @laboratory.experiments.without_children
  end

  def show
  end

  def new
    @experiment = @laboratory.experiments.build
  end

  def create
    @experiment = Experiment.new(experiment_params)

    respond_to do |format|
      if @experiment.save
        format.html { redirect_to @experiment }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @experiment.update(experiment_params)
        @experiment.inject_last_updator(current_user)

        # TODO: return the user to the same place he came from
        # redirect_to_previous_screen anchor: @experiment
        # redirect_to assumptions_path(current_laboratory, experiment: @experiment.id)
        format.html { redirect_to @experiment }
        format.js
      end
    end
  end

private

  def set_experiment
    @experiment = Experiment.find(params[:id])
  end

  def experiment_params
    params.require(:experiment).permit(
      :assumption_attributes => [:id, :body], 
      :result_attributes => [:id, :body], 
      :action_attributes => [:id, :body]
    )
  end
end
