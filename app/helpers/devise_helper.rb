module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map{|msg| content_tag(:li, msg)}.join
    html = <<-HTML
    <div class="alert alert-error alert-danger" id="alert">
      <button type="button" onclick=close_alert() class="close" data-dismiss="alert">×</button>
      #{messages}
    </div>
    HTML

    safe_join html
  end
end
