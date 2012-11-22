class AddAttachmentBannerToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.has_attached_file :banner
    end
  end

  def self.down
    drop_attached_file :posts, :banner
  end
end
