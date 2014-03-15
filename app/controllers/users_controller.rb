class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :signup_failed


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if User.create!(email: params[:user][:email],
                      password: params[:user][:password],
                      password_confirmation: params[:user][:password_confirmation],
                      user_name: params[:user][:user_name],
                      greeting: params[:user][:greeting])

        format.html { redirect_to users_index_path, notice: 'Wino was successfully created.' }
        format.json { render action: 'show', status: :created, location: user }
      else
        format.html { render action: 'new' }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find_by_email(current_user.email)
    #@user.password = params[:user][:password]
    #@user.password_confirmation = params[:user][:password_confirmation]
    #@user.user_name = params[:user][:user_name]
    #@user.greeting = params[:user][:greeting]
    respond_to do |format|
      #if @user.save! != nil
      if @user.update_attributes!( user_params )
        format.html { redirect_to :root, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find_by_email(current_user.email)
  end

  def destroy
  end

  def show
      user_id = params[:id].to_i
    @is_owner = user_id == current_user.id
    @title = "Cellar for #{User.find(user_id).name}"
    @greeting = User.find(user_id).greeting
    @bottles = Bottle.where("user_id = #{user_id}")
  end



  private

  def signup_failed
    flash[:error] = "Creation Failed"
    redirect_to edit_user_path(current_user.id), notice: 'Wino creation failed'
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :greeting, :user_name)
  end

end
