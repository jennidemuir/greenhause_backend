class Plantcard < ApplicationRecord
    has_many :plantcollections
    has_many :users, through: :plantcollections
end
