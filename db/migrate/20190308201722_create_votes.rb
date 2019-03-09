class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :direction, null: false
      t.references :user, foreign_key: true
      t.references :voteable, polymorphic: true
      t.timestamps
    end

    add_index :votes, [ :user_id, :voteable_id, :voteable_type ], unique: true

  end
end
