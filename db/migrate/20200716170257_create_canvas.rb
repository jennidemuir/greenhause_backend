class CreateCanvas < ActiveRecord::Migration[6.0]
  def change
    create_table :canvas do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :canvas
      t.string :canvas_notes

      t.timestamps
    end
  end
end
