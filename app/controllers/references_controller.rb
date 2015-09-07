class ReferencesController < ApplicationController
  before_action :require_admin
  def new
  end

  def destroy
    Reference.find(params[:id]).destroy
    redirect_to resume_path
  end
end
