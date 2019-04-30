class CreatePerspectives < ActiveRecord::Migration[5.1]
  def change
    create_table :perspectives do |t|
      t.string :body, null: false
      t.integer :num_upvotes, null: false, default: 0
      t.integer :num_downvotes, null: false, default: 0
      t.integer :num_comments, null: false, default: 0
      t.references :scoop, foreign_key: true
      t.references :user, foreign_key: true
      t.string :viewpoint, null: false

      t.timestamps
    end
  end
end
