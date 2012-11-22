module PostsHelper

  def render_blog_post(post)
    # We need to use syntax highlighting to color the code blocks within the post
    raw post.gsub(/<pre>.+?<\/pre>/m) { |v| Pygments.highlight(v.gsub(/<pre>|<\/pre>/, '').gsub(/&gt;/, '>').gsub(/&lt;/, '<'), lexer: 'ruby') }
  end

end
