module ApplicationHelper
  MAX_CONTENT_LENGHT = 50

  def truncate_content(content)
    content.truncate(MAX_CONTENT_LENGHT)
  end

  def bootstrap_alert_type(type)
    case type
    when 'alert'
      'danger'
    when 'notice'
      'success'
    else
      'seconday'
    end
  end
end
