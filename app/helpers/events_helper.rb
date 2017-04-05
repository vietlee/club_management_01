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
end
