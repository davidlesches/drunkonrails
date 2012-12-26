atom_feed do |feed|
  feed.title "Drunk on Rails"
  feed.updated @posts.maximum(:updated_at)
  @posts.each do |article|
    feed.entry article do |entry|
      entry.title article.title
      entry.content "type" => "html" do entry.cdata!(markdown(article.body)) end
      entry.author do |author|
        author.name article.administrators.map(&:name).join(', ')
      end
    end
  end
end