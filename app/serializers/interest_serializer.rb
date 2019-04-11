class InterestSerializer < ActiveModel::Serializer
  attributes :id, :user, :product
  # belongs_to :product
  # belongs_to :user
end
