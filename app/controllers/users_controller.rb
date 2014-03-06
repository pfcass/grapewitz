class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    User.create!(email: params[:user][:email],
                password: params[:user][:password],
                password_confirmation: params[:user][:password_confirmation])
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @bottles = Bottle.find_all_by_user_id( current_user.id )
  end
end
