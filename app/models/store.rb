class Store < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }, :presence => true

  has_many :bottles, :dependent => :destroy
  has_many :wines, :through => :bottles
end