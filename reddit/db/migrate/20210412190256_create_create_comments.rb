class CreateCreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :author_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
