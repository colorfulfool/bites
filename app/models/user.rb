class User < ApplicationRecord
  has_many :accesses
  has_many :laboratories, through: :accesses

  has_secure_password

  def first_name
    full_name.split(' ').first
  end
end
