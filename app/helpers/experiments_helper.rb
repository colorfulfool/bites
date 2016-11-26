module ExperimentsHelper
  def text_or_button(experiment, line, create_label)
    if experiment.send(line).present?
      highlight_references experiment.send(line).body
    else
      link_to create_label, new_polymorphic_path([experiment, line]), class: 'button'
    end
  end

  def highlight_references(text)
    text.gsub(/\[([^:\]]+?)[:\d]*\]/) do |reference|
      "<u>#{$1}</u>"
    end.html_safe
  end
end
