module ApplicationHelper
  def get_title(page_name = '')
    basic_title = 'Memoria'
    if page_name.empty?
      basic_title
    else
      "#{page_name} | #{basic_title}"
    end
  end

  def header_show?
    flag = true;
    now = request.path
    ignore = [root_path, signup_path]
    ignore.each do |igpath|
      if now == igpath
        flag = false
      end
    end
    return flag
  end
end
