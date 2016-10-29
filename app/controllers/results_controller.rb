class ResultsController < ApplicationController
  def new
  end

  def index
    @experiments = Experiment.have_result
    render 'experiments/index'
  end
end
