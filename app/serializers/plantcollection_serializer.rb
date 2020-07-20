class PlantcollectionSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :plantcard
end
