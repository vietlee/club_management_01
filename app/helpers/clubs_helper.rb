module ClubsHelper
  def get_day_view days
    days.join("-")
  end

  def get_field_club field
    raw(field) if field.present?
  end

  def check_date days, day
    days.include? day
  end

  def view_detail_club content_view
    if content_view.blank?
      html = <<-HTML
        <h5 class="text-center"><strong><i>#{t("content_empty")}</i></strong></h5>
      HTML
      raw html
    else
      html = <<-HTML
        #{content_view}
      HTML
      raw html
    end
  end
end
