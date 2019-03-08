class CreateScoops < ActiveRecord::Migration[5.1]
  def change
    create_table :scoops do |t|
      t.string :name
      t.string :image_path

      t.timestamps
    end
  end
end
