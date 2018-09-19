class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments.where(parent_comment_id: nil)
  end

  def destroy
  end
  
  def new
    @subs = Sub.all
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end
end
