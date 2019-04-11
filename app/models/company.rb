class Company < ApplicationRecord
  has_many :products, dependent: :destroy
end
