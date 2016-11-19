class Result < ApplicationRecord
  belongs_to :experiment

  include LastUpdator
end
