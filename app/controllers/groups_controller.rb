class GroupsController < ApplicationController
# before_action :authenticate_admin!

  def index
    @groups = Group.all.order('created_at DESC')
    @group = Group.new
  end

  def edit
    @group=Group.find(params[:id])
  end

  def update
    @group =Group.find(params[:id])  
    @group.name = params[:group][:name]
    if @group.save
      redirect_to groups_path, notice: "Edytowano"
    else
      redirect_to groups_path, notice: "Blad"
    end
  end
  
  def new
    @group=Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path, notice: "Utworzono"
    else
      redirect_to groups_path, notice: "Blad"
    end
  end

  def destroy
    if Group.find(params[:id]).destroy
      redirect_to groups_path notice: "Usunieto"
    else
      redirect_to groups_path notice: "Nie usunieto"
    end
  end

  def group_params
    params.require(:group).permit(:name)
  end

end
