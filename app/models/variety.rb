class Variety < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }, :presence => true
  validates :color, :presence => true
  validates :fizz, :presence => true

  has_many :wines, :dependent => :destroy
  has_many :bottles, :through => :wines

  #constants
  RED = 0
  WHITE = 1
  ROSE = 2

  STILL = 0
  FIZZY = 1

end
