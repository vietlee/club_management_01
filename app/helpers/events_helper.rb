module EventsHelper
  def number_to_vnd amount
    "#{amount} <sup>vnđ</sup>".html_safe
  end
end
