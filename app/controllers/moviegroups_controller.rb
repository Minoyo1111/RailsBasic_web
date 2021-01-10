class MoviegroupsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  def index
    @moviegroups = Moviegroup.all
  end

  def new
    @moviegroup = Moviegroup.new
  end

  def edit
    @moviegroup = Moviegroup.find(params[:id])
    if current_user != @moviegroup.user
      redirect_to root_path, alert: "你不能進來喔！"
    end
  end

  def show
    @moviegroup = Moviegroup.find(params[:id])
    @posts = @moviegroup.posts.recent.paginate(page: params[:page], per_page: 5)
  end

  def create
    @moviegroup = Moviegroup.new(moviegroup_params)
    @moviegroup.user = current_user
    if @moviegroup.save
      redirect_to moviegroups_path
    else
      render :new
    end
  end 
  def update
    @moviegroup = Moviegroup.find(params[:id])
    if current_user != @moviegroup.user
      redirect_to root_path, alert: "你不能進來喔！"
    end
    if @moviegroup.update(moviegroup_params)
      redirect_to moviegroups_path, notice: '更新成功'
    else
      render :edit
    end
  end
  def destroy
    @moviegroup = Moviegroup.find(params[:id])

    if current_user != @moviegroup.user
      redirect_to root_path, alert: "你不能進來喔！"
    end
    @moviegroup.destroy
    redirect_to moviegroups_path, notice: '已刪除'
  end
private
  def moviegroup_params
    params.require(:moviegroup).permit(:title, :description)
  end

end
