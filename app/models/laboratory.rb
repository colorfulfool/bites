class Laboratory < ApplicationRecord
  has_many :experiments

  include NameAsUrl
end
