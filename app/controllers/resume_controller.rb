class ResumeController < ApplicationController
  def index
    @sections = Section.all
    @references = Reference.all
  end
end
