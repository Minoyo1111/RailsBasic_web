class MoviegroupsController < ApplicationController
  def index
    @moviegroups = Moviegroup.all
  end

  def new
    @moviegroup = Moviegroup.new
  end

  def deit
    @moviegroup = Moviegroup.find(params[:id])
  end

  def show
    @moviegroup = Moviegroup.find(params[:id])
  end

  def create
    @moviegroup = Moviegroup.new(moviegroup_params)
    if @moviegroup.save
      redirect_to moviegroups_path
    else
      render :new
    end
  end 
  def update
    @moviegroup = Moviegroup.find(params[:id])
    if @moviegroup.update(moviegroup_params)
      redirect_to moviegroups_path, notice: '更新成功'
    else
      render :edit
    end
  end
  def destroy
    @moviegroup = Moviegroup.find(params[:id])
    @moviegroup.destroy
    redirect_to moviegroups_path, notice: '已刪除'
  end
private
  def moviegroup_params
    params.require(:moviegroup).permit(:title, :description)
  end

end
