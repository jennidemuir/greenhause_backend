class PlantcardSerializer < ActiveModel::Serializer
  attributes :id, :commonname, :scientificname, :img_url
end
