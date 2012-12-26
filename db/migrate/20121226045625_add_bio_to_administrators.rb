class AddBioToAdministrators < ActiveRecord::Migration
  def change
    add_column :administrators, :bio, :text
  end
end
