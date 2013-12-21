class CreateStuffsTagsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :stuffs , :tags
  end

end
