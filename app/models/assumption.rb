class Assumption < ApplicationRecord
  belongs_to :experiment

  include LastUpdator
end