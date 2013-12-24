class AddIdToStuffsTags < ActiveRecord::Migration
  def change
    add_column :stuffs_tags, :id, :primary_key
  end
end
