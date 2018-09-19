class SubsController < ApplicationController
  def new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
  end

  def update
    # debugger
    @sub = current_user.subs.find_by(id: params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
    @posts = @sub.posts
  end

  def index
    @subs = Sub.all
  end
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
