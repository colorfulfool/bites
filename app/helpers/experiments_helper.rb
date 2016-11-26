module ExperimentsHelper
  def render_experiment_line(line)
    if line.present?
      content_tag :div, highlight_references(line.body), class: 'line'
    end
  end

  def render_button_for(experiment)
    if experiment.assumption.nil?
      link_to 'Make an assumption', new_laboratory_experiment_path(current_laboratory), remote: true, class: 'button'
    elsif experiment.result.nil?
      link_to 'Log results', new_experiment_result_path(experiment), remote: true, class: 'button'
    elsif experiment.action.nil?
      link_to 'Take action', new_experiment_action_path(experiment), class: 'button'
    end
  end

  def highlight_references(text)
    text.gsub(/\[([^:\]]+?)[:\d]*\]/) do |reference|
      "<u>#{$1}</u>"
    end.html_safe
  end
end
