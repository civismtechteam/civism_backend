class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :direction, null: false
      t.references :user, foreign_key: true
      t.references :voteable, polymorphic: true, index: true

      add_index :releases, [ :user_id, :votable_id, :voteable_type ], unique: true

      t.timestamps
    end
  end
end
