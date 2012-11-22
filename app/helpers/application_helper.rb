module ApplicationHelper

  def title(title = nil)
    if title.present?
      content_for :title, title
    else
      content_for?(:title) ? content_for(:title) : CONFIG['default_title']
    end
  end

  def meta_keywords(tags = nil)
    if tags.present?
      content_for :meta_keywords, tags
    else
      content_for?(:meta_keywords) ? [content_for(:meta_keywords), CONFIG['meta_keywords']].join(', ') : CONFIG['meta_keywords']
    end
  end

  def meta_description(desc = nil)
    if desc.present?
      content_for :meta_description, desc
    else
      content_for?(:meta_description) ? content_for(:meta_description) : CONFIG['meta_description']
    end
  end

end
