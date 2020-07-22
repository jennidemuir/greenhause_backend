class CreatePlantcards < ActiveRecord::Migration[6.0]
  def change
    create_table :plantcards do |t|
      t.string :commonname
      t.string :scientificname
      t.string :img_url

      t.timestamps
    end
  end
end
