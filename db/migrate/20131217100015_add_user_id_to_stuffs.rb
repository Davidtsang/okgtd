class AddUserIdToStuffs < ActiveRecord::Migration
  def change
    add_column :stuffs, :user_id, :integer
    add_index :stuffs, :user_id
  end
    
end
