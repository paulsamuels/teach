module TopicsHelper
  
  def format_display_option(option)
    result = option > 0 ? "Yes" : "No"
    "<b>#{result}</b>"
  end
  
end
