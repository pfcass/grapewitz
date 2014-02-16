class Wine < ActiveRecord::Base
  belongs_to :brand
  belongs_to :variety
  has_many :bottles, :dependent => :destroy, :through => wines

end
