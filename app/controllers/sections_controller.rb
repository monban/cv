class SectionsController < ApplicationController
  before_action :require_admin

  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end
  
  def create
    @section = Section.new section_params
    @section.save!
    redirect_to resume_path
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

  def destroy
    Section.find(params[:id]).destroy
    redirect_to resume_path
  end

  protected

  def section_params
    params.require(:section).permit(:title, :content)
  end
end
