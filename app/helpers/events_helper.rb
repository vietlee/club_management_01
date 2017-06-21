module EventsHelper
  def number_to_vnd amount
    "#{amount} <sup>vnđ</sup>".html_safe
  end

  def view_case_money_after event
    if event.subsidy?
      after_money = event.amount.to_i + event.expense.to_i
    end
    if event.pay_money?
      after_money = event.amount.to_i - event.expense.to_i
    end
    if event.get_money?
      after_money = event.amount.to_i + (@members_done.size.to_i * event.expense.to_i)
    end
    after_money
  end

  def view_notification event
    case event.event_category
    when Settings.get_money
      "#{t("after_get_money")}"
    when Settings.pay_money
      "#{t("after_pay_money")}"
    when Settings.subsidy
      "#{t("after_receive_money")}"
    else
      "#{t("notification_event")}"
    end
  end

  def view_case_money_event_after event, club
    members_done = club.users.done_by_ids(event.budgets.map(&:user_id))
    case event.event_category
    when Settings.get_money
      after_money = event.amount.to_i + (members_done.size.to_i * event.expense.to_i)
    when Settings.pay_money
      after_money = event.amount.to_i - event.expense.to_i
    when Settings.subsidy
      after_money = event.amount.to_i + event.expense.to_i
    else
      after_money = nil
    end
    after_money
  end

  def view_class event
    if event.pay_money?
      class_result = Settings.red_class
    else
      class_result = Settings.blue_class
    end
    class_result
  end

  def view_icon event
    if event.pay_money?
      html = <<-HTML
        <i class="fa fa-minus get-money-icon" aria-hidden="true"></i>
        HTML
      html.html_safe
    else
      html = <<-HTML
        <i class="fa fa-plus pay-money-icon" aria-hidden="true"></i>
        HTML
      html.html_safe
    end
  end

  def count_member_done event, club
    members_done = club.users.done_by_ids(event.budgets.map(&:user_id))
    html = <<-HTML
      (#{members_done.size} <i class="fa fa-user-o" aria-hidden="true"></i>)
      HTML
    html.html_safe
  end
end
