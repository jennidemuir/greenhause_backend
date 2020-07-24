class Canva < ApplicationRecord
  has_one_attached :canvas
  belongs_to :user
end
