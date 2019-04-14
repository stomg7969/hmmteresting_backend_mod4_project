class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :img, :email
  # has_many :interests
end
