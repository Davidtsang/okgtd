class CreateStuffs < ActiveRecord::Migration
  def change
    create_table :stuffs do |t|
      t.string :content
      t.integer :statu_code
      t.integer :parent_id
      t.date :deadline
      t.date :doing_date
      t.integer :plan_time

      t.timestamps

    end
  end
end
