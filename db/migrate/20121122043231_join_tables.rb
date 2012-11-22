class JoinTables < ActiveRecord::Migration
  def change
    create_table :posts_tags do |t|
      t.integer :post_id
      t.integer :tag_id
    end

    create_table :administrators_tags do |t|
      t.integer :administrator_id
      t.integer :post_id
    end

    add_index :posts_tags, [:post_id, :tag_id]
    add_index :administrators_tags, [:administrator_id, :post_id]
  end
end
