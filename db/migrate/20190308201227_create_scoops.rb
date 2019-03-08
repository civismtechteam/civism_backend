class CreateScoops < ActiveRecord::Migration[5.1]
  def change
    create_table :scoops do |t|
      t.string :name, null: false
      t.string :image_path, null: false

      t.timestamps
    end
  end
end
