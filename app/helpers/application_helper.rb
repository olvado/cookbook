module ApplicationHelper

  def active_path(path)
    " is_active" if current_page?(path)
  end

end
