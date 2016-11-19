module ReferencesTracking
  extend ActiveSupport::Concern

  included do
    has_many :action_references
    has_many :referenced_by_action # backlink
    has_many :assumption_references
    has_many :referenced_by_assumption # backlink

    before_save :update_name_from_text
    before_save :update_references_from_text
  end

  def parents
    referenced_by_action.merge assumption_references
  end

  def children
    action_references.merge referenced_by_assumption
  end

  def update_references_from_text
    assumption_references = ReferencesDetector.references_in assumption.body
    action_references = ReferencesDetector.references_in action.body if action.present?
  end

  def update_name_from_text
    self.name = ReferencesDetector.declarations_in(assumption.body).first
  end
end