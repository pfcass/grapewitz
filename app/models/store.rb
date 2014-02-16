class Store < ActiveRecord::Base
  has_many :bottles, :dependent => :destroy
  has_many :wines, :through => :bottles
end