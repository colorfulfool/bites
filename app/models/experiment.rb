class Experiment < ApplicationRecord
  belongs_to :laboratory
  
  has_one :assumption
  has_one :result
  has_one :action

  accepts_nested_attributes_for :assumption, :result, :action

  def inject_last_updator(user)
    updated_line = [assumption, result, action].compact.max_by(&:updated_at)
    updated_line.update_attribute(:last_updator, user)
  end
end
