class User < ApplicationRecord
  has_secure_password
  has_many :interests, dependent: :destroy
  has_many :products, :through => :interests
  validates :username, uniqueness: { case_sensitive: false }

  
end
