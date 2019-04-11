class Product < ApplicationRecord
  belongs_to :company
  has_many :interests, dependent: :destroy
  has_many :users, :through => :interests
end
