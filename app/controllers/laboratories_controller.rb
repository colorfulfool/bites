class LaboratoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @laboratories = current_user.laboratories
    if @laboratories.one?
      redirect_to @laboratories.take
    end
  end

  def show
    redirect_to laboratory_experiments_path(@laboratory)
  end

private

  def set_laboratory
    @laboratory = Laboratory.find_by slug: params[:id]
  end
end
