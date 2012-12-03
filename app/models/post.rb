class Post < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :history

  has_and_belongs_to_many :tags
  has_and_belongs_to_many :administrators
  has_attached_file :banner, :styles => { medium: "300x300", small: "200x200", thumb: "100x100" }

  attr_accessible :title, :body, :teaser, :banner, :tag_ids, :slug, :administrator_ids, :published

  validates :title, :body, :teaser, presence: true

  scope :published, where(:published => true)



  def related
    related = []
    self.tags.each do |tag|
      related << tag.posts.order("updated_at desc").first(5)
    end
    related.flatten.uniq.sort_by(&:updated_at).reverse.first(6)

    # update to filter by how similar it is
    # subtract the current post from the final array
  end

end
