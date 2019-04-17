class Company < ApplicationRecord
  has_secure_password
  has_many :products, dependent: :destroy
end
