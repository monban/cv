module ReferencesHelper
  def edit_reference(reference)
    if admin?
      link_to('Edit', edit_reference_path(reference))
    else
      ''
    end
  end
end
