class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :signup_failed


  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.user_name
  end

  def create
    respond_to do |format|
      if User.create!(email: params[:user][:email],
                      password: params[:user][:password],
                      password_confirmation: params[:user][:password_confirmation],
                      user_name: params[:user][:user_name],
                      greeting: params[:user][:greeting])

        format.html { redirect_to users_path, notice: 'Wino was successfully created.' }
        format.json { render action: 'show', status: :created, location: user }
      else
        format.html { render action: 'new' }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find_by_email(current_user.email)

    if user_params[:password] == "" && user_params[:password_confirmation] == ""
      respond_to do |format|
        if @user.update_attribute(:user_name, user_params[:user_name]) &&
            @user.update_attribute(:greeting, user_params[:greeting])
          format.html { redirect_to user_path @user, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @user.update_attributes!(user_params)
          format.html { redirect_to user_path @user, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
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
    if Bottle.count == 0
      @title += ", but sadly your cellar is empty"
    end
    @greeting = User.find(user_id).greeting
    @bottles = Bottle.where("user_id = #{user_id}")

    # We're going to compute some extra info here
    #
    @n_bottles = 0
    @total_paid_price = 0.0
    @total_list_price = 0.0
    @total_saved = 0.0
    @bottles.each do |b|
      if b.price == nil && b.list_price == nil
        # no price info, so skip it
        next
      elsif b.price != nil && b.list_price != nil
        # have paid and list, so we can do a full analysis
        @total_paid_price += b.price * b.quantity
        @total_list_price += b.list_price * b.quantity
        @total_saved += (b.list_price - b.price) * b.quantity
      elsif b.price != nil
        # go w/ the paid price
        @total_paid_price += b.price * b.quantity
        @total_list_price += b.price * b.quantity
      elsif b.list_price != nil
        #user the list price
        @total_paid_price += b.list_price * b.quantity
        @total_list_price += b.list_price * b.quantity
      end
      @n_bottles += b.quantity
    end
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
