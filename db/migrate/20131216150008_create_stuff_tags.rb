class CreateStuffTags < ActiveRecord::Migration
  def change
    create_table :stuff_tags do |t|
      t.integer :stuff_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :stuff_tags, [:stuff_id, :tag_id], unique:true
  end
end
