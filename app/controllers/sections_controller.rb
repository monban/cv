class SectionsController < ApplicationController
  before_action :require_admin

  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end

  def edit
    @section = Section.find params[:id] 
  end

  def show
    @section = Section.find params[:id] 
  end

  def update
    @section = Section.find(params[:id])
    @section.update(section_params)
    redirect_to resume_path
  end

  protected

  def section_params
    params.require(:section).permit(:title, :content)
  end
end
