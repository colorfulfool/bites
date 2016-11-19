class Laboratory < ApplicationRecord
  has_many :experiments

  # TODO: access control system
  has_many :users
  belongs_to :owner, class_name: 'User'

  include NameAsUrl
end
