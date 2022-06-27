module ApplicationHelper
  MAX_CONTENT_LENGHT = 50

  def truncate_content(content)
    content.truncate(MAX_CONTENT_LENGHT)
  end
end
