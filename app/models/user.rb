class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable  #, :registerable

  has_many :bottles, dependent: :destroy
  has_many :links, dependent: :destroy

  def admin?
    if /witz/ =~ self.email
      true
    else
      false
    end
  end

  def name
    if self.user_name == nil || self.user_name == ""
      self.email
    else
      self.user_name
    end
  end

  def self.also_have( this_bottle )
    @users = []
    if this_bottle == nil
      @users
    else
      bottles = Bottle.where( "wine_id = ?", this_bottle.wine_id )
      bottles.each do |b|
        if b.user_id != this_bottle.user_id
          @users.push(User.find(b.user_id))
        end
      end
      @users.uniq
    end
  end
end
