module ReferencesHelper
  def edit_reference(reference)
    if admin?
      link_to('Edit', edit_reference_path(reference))
    else
      ''
    end
  end
  def delete_reference_link(reference)
    if admin?
      link_to 'Delete reference', reference, method: 'delete'
    else
      ''
    end
  end
end
