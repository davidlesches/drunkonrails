class PostsController < ApplicationController

  inherit_resources
  actions :show, :index

  def index
    @posts = Post.published.includes(:administrators, :tags).order("created_at desc").page params[:page]
  end

  def show
    @post = Post.find(params[:id])

    # Check if the slug has changed. See FriendlyId docs.
    if request.path != post_path(@post)
      return redirect_to @post, :status => :moved_permanently
    end
  end

  def tag
    tag = Tag.find(params[:tag])
    @posts = tag.posts.where(:published => true).includes(:administrators, :tags).page params[:page]
    render :index
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path
  end

end
