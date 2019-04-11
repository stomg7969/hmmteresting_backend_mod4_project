class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :catch_phrase, :logo
  # has_many :products
end
