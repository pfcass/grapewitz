class Variety < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }

  has_many :wines, :dependent => :destroy
  has_many :bottles, :through => :wines
end
