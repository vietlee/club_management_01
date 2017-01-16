module RequestHelper
  def request_status request, result = t("approved")
    result = t("un_approve") unless request.approve
    result
  end
end
