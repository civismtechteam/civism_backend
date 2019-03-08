class CreateFacts < ActiveRecord::Migration[5.1]
  def change
    create_table :facts do |t|
      t.string :body
      t.string :source_link
      t.integer :num_upvotes
      t.integer :num_downvotes
      t.integer :num_comments
      t.references :scoop, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
