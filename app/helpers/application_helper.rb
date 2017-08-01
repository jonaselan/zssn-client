module ApplicationHelper
  def flash_message
    msg = ''
    [:success, :info, :warning, :danger].each do |type|
      if flash[type]
         msg += "<p class=\"alert alert-#{type}\">#{flash[type]}</p>"
      end
    end
    return raw msg
  end
end
