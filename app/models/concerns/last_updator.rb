module LastUpdator
  extend ActiveSupport::Concern

  included do
    belongs_to :last_updator, class_name: 'User'
  end
end