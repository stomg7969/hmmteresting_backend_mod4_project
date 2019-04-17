class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :company, :category, :description, :img, :quota, :completed, :interests
  # has_one :company
  # has_many :interests


end
