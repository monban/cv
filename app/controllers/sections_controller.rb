class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def edit
    @section = Section.find params[:id] 
  end

  def update
    @section = Section.find(params[:id])
    @section.update(section_params)
    redirect_to section_path(@section)
  end

  protected

  def section_params
    params.require(:section).permit(:title, :content)
  end
end
