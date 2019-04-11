class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :img, :email, :password
  # has_many :interests
end
