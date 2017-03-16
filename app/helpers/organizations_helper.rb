module OrganizationsHelper
  def select_case_view organization

    if !current_user.joined_organization?(organization) &&
      current_user.pending_organization?(organization)
      content_tag(:i, nil, class: "fa fa-check fa-2x", title: t("joined"))
    elsif current_user.joined_organization?(organization) &&
      !current_user.pending_organization?(organization)
      content_tag(:i, nil, class: "fa fa-exclamation-triangle", title: t("danger"))
    end
  end
end
