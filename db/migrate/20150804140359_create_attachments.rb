class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :post_id
      t.integer :user_id
      t.string  :name
      t.integer :attachmentable_id
      t.string  :attachmentable_type

      t.timestamps null: false
    end
    add_index :attachments, :attachmentable_id

  end
end
