class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  def new
    @moviegroup = Moviegroup.find(params[:moviegroup_id])
    @post = Post.new
  end

  def create
    @moviegroup = Moviegroup.find(params[:moviegroup_id])
    @post = Post.new(post_params)
    @post.moviegroup = @moviegroup
    @post.user = current_user

    if @post.save
      redirect_to moviegroup_path(@moviegroup)
    else
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
