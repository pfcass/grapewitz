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
      if user = User.create!(email: params[:user][:email],
                      password: params[:user][:password],
                      password_confirmation: params[:user][:password_confirmation])

        format.html { redirect_to users_index_path, notice: 'Wino was successfully created.' }
        format.json { render action: 'show', status: :created, location: user }
      else
        format.html { render action: 'new' }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
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



  private

  def signup_failed
    flash[:error] = "Creation Failed"
    redirect_to users_index_path, notice: 'Wino creation failed'
  end

end
