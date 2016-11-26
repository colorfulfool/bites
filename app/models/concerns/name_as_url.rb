module NameAsUrl
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]
  end

  def should_generate_new_friendly_id?
    slug.nil?
  end
end