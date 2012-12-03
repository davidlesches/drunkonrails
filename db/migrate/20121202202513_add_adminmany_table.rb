class AddAdminmanyTable < ActiveRecord::Migration
  def change

    drop_table :administrators_tags

    create_table :administrators_posts do |t|
      t.integer :administrator_id
      t.integer :post_id
    end

    add_index :administrators_posts, [:administrator_id, :post_id]


  end
end
