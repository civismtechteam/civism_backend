class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :num_upvotes, null: false, default: 0
      t.integer :num_downvotes, null: false, default: 0
      t.integer :num_comments, null: false, default: 0
      t.references :commentable, polymorphic: true, index: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
