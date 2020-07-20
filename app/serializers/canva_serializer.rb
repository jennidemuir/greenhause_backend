class CanvaSerializer < ActiveModel::Serializer
  attributes :id, :canvas_notes
  has_one :user
end
