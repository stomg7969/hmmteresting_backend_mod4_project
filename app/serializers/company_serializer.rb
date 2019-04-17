class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :catch_phrase, :logo, :products
  # has_many :products
end
