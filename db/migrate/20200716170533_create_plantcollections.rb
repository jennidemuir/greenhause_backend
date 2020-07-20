class CreatePlantcollections < ActiveRecord::Migration[6.0]
  def change
    create_table :plantcollections do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :plantcard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
