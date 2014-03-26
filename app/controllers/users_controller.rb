class UsersController < ApplicationController


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

end
