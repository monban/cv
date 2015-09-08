module ApplicationHelper
  def new_section_link
    if admin?
      link_to 'New section', new_section_path
    else
      ''
    end
  end
  def new_reference_link
    if admin?
      link_to 'New reference', new_reference_path
    else
      ''
    end
  end
  def render_markdown(text)
    Kramdown::Document.new(text).to_html
  end
end
