module SectionsHelper
  def edit_section(section)
    if admin?
      link_to('Edit', edit_section_path(section))
    else
      ''
    end
  end
  def delete_section_link(section)
    if admin?
      link_to 'Delete section', section, method: 'delete'
    else
      ''
    end
  end
  def render_section_content(section)
    render_markdown(section.content).html_safe
  end
end
