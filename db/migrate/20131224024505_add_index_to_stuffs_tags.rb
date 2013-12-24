class AddIndexToStuffsTags < ActiveRecord::Migration
  def change
    add_index :stuffs_tags, [:stuff_id, :tag_id], unique: true
  end
end
