class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.create!(email: params[:user][:email],
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
  end
end
