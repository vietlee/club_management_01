module Manager::RequestsHelper
  def view_sidebar_club organization
    "#{organization.name}
    <span class='label label-primary label-indicator
      animation-floating'>
      #{organization.club_requests.pending.size}
    </span>".html_safe
  end
  def view_side_bar_memeber organization
    "#{organization.name}
    <span class='label label-primary label-indicator
      animation-floating'>
      #{organization.user_organizations.pending.size}
    </span>".html_safe
  end
end
