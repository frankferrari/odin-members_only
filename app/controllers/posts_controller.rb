class PostsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  # Use strong parameters to whitelist allowed attributes
  def post_params
    params.require(:post).permit(:title, :body, :user_id) # Add :user_id or any other permitted parameters
  end

end
