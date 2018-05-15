module ApplicationHelper
  def get_title(page_name = '')
    basic_title = 'Memoria'
    if page_name.empty?
      basic_title
    else
      "#{page_name} | #{basic_title}"
    end
  end
end
