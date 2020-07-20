class PlantcardSerializer < ActiveModel::Serializer
  attributes :id, :commonname, :scientificname, :description
end
