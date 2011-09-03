module TopicsHelper
  
  def format_display_option(option)
    result = option ? "Yes" : "No"
    "<b>#{result}</b>"
  end
  
end
