class UsersController < ApplicationController
# before_action :authenticate_admin!

  def index
    @users = User.all.order('created_at DESC')
    @user = User.new
    @groups = Group.all
  end

  def edit
    @user=User.find(params[:id])
    @groups = Group.all
  end

  def update
    @user =User.find(params[:id])  
    @user.name = params[:user][:name]
    @user.surname = params[:user][:surname]
    unless params[:user][:group_id] == ''
      @user.group = Group.find(params[:user][:group_id])
    else
      @user.group = nil
    end
    if @user.save
      redirect_to users_path, notice: "Edytowano "+@user.name+@user.surname
    else
      redirect_to users_path, notice: "Blad w edycji "+@user.name+@user.surname
    end
  end
  
  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "Utworzono "+@user.name+' '+@user.surname
    else
      redirect_to users_path, notice: "Blad w tworzeniu "+@user.name+' '+@user.surname
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to users_path, notice: "Usunieto "+user.name+' '+user.surname
    else
      redirect_to users_path, notice: "Nie usunieto "+user.name+' '+user.surname
    end
  end

  def user_params
    params.require(:user).permit(:name, :surname, :group_id)
  end

  def add_user_group
    u = User.find(params[:user])
    u.add_to_group(params[:group])
    if u.save
      redirect_to users_path, notice: 'Dodano do grupy '+u.name+' '+u.surname
    else
      redirect_to users_path, notice: 'Blad w dodawaniu '+u.name+' '+u.surname
    end
  end

end
