class ChangeRoleTypeInUser < ActiveRecord::Migration
 
   def self.up
    change_column :users, :role, :integer , :default => 1
  end
 
  def self.down
    change_column :posts, :body, :string
  end
end
