class ReferencesController < ApplicationController
  before_action :require_admin
  def new
    @reference = Reference.new
  end

  def create
    Reference.create(reference_params)
    redirect_to resume_path
  end

  def edit
    @reference = Reference.find(params[:id])
  end

  def update
    @reference = Reference.find(params[:id])
    @reference.update(reference_params)
    redirect_to resume_path
  end

  def destroy
    Reference.find(params[:id]).destroy
    redirect_to resume_path
  end

  protected

  def reference_params
    params.require(:reference).permit(:name, :telephone, :email, :relationship, :endorsement)
  end
end
