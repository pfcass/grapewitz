class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable  #, :registerable

  has_many :bottles, dependent: :destroy

  def admin?
    if /witz/ =~ self.email
      true
    else
      false
    end
  end

  def self.also_have( this_bottle )
    bottles = Bottle.where( "wine_id = ?", this_bottle.wine_id )
    @users = []
    bottles.each do |b|
      if b.user_id != this_bottle.user_id
        @users.push( User.find( b.user_id ) )
      end
    end
    @users.uniq
  end
end
