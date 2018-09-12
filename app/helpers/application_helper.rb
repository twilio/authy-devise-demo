module ApplicationHelper
  def flash_class(level)
    case level.to_s
      when "notice" then "toast toast-primary"
      when "alert" then "toast toast-warning"
      else "toast toast-#{level}"
    end
  end
end
