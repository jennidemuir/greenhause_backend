class CanvaSerializer < ActiveModel::Serializer
  attributes :id, :canvas_notes, :image
  has_one :user
end
