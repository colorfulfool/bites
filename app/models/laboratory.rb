class Laboratory < ApplicationRecord
  has_many :experiments

  # TODO: access control system
  belongs_to :owner, class_name: 'User'
  has_many :accesses
  has_many :users, through: :accesses

  include NameAsUrl
end
