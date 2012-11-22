class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :twitter
      t.string :password_digest

      t.timestamps
    end
  end
end
