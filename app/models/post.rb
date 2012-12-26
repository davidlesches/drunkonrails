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
    related = {}
    self.tags.each do |tag|
      tag.posts.published.each do |post|
        next if post == self
        related[post.id] = related[post.id] ? related[post.id] + 1 : 1
      end
    end

    if related.any?
      ids = related.sort_by {|k, v| v}.reverse.take(5).map { |k, v| k }
      Post.find ids
    else
      Post.published.order('created_at desc').first(5).to_a - Array(self)
    end
  end

end
