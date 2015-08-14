class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :post_id
      t.integer :user_id
      t.string  :image_name
      t.integer :imageable_id
      t.string  :imageable_type

      t.timestamps null: false
    end
  end
end
