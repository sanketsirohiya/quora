class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :qa_id
      t.string :utype, null: false
      t.timestamps null: false
    end
  end
end
