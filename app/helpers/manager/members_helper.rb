module Manager::MembersHelper
  def choose_view_company user_id, organization_id
    user_organization = UserOrganization.find_with_user_of_company user_id,
      organization_id
    if user_organization.joined?
      t "actived"
    else
      link_to t("active"), manager_member_path(user_organization), method: :put,
        remote: true, class: "btn btn-primary", data: {confirm: t("answer_active")}
    end
  end

  def choose_view_club user_id, club_id
    if UserClub.find_with_user_of_club(user_id, club_id).status?
      t "actived"
    else
      t "not_active"
    end
  end
end
