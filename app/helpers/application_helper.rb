module ApplicationHelper
  def flash_class(level)
    case level.to_s
      when "notice" then "toast toast-primary"
      when "alert" then "toast toast-warning"
      else "toast toast-#{level}"
    end
  end

  def gravatar_url(email, size)
    gravatar = Digest::MD5::hexdigest(email.downcase).downcase
    url = "http://gravatar.com/avatar/#{gravatar}?s=#{size}"
  end
end
