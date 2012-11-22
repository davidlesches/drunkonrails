class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :teaser
      t.text :body
      t.string :slug
      t.boolean :published

      t.timestamps
    end
  end
end
