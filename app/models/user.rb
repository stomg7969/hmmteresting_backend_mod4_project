class User < ApplicationRecord
  has_many :interests, dependent: :destroy
  has_many :products, :through => :interests
end
