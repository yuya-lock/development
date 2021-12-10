module ApplicationHelper
  def page_title
    title = "Zinnia"
    title = @page_title + " - " + title if @page_title
    title
  end
end
