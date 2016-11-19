class Action < ApplicationRecord
  belongs_to :experiment

  include LastUpdator
end
