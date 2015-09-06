module SectionsHelper
  def edit_section(section)
    if admin?
      link_to('Edit', edit_section_path(section))
    else
      ''
    end
  end
end
