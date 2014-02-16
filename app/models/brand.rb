class Brand < ActiveRecord::Base
  has_many :wines, :dependent => :destroy
  has_many :bottles, :through => :wines
end
