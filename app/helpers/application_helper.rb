module ApplicationHelper
  def page_title
    "Bites of #{current_laboratory&.name}" || 'Bites'
  end

  def navigational_link(*arguments, &block)
    link_to *arguments, &block
  end
end
