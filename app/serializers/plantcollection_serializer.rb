class PlantcollectionSerializer < ActiveModel::Serializer
  attributes :id, :plantnote
  has_one :user
  has_one :plantcard
end
