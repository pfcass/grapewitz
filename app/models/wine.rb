class Wine < ActiveRecord::Base
  belongs_to :brand
  belongs_to :variety
  has_many :bottles, :dependent => :destroy
  has_many :stores, :through => :bottles, :dependent => :destroy

  def wine_name
    [ brand.name, variety.name ].reject(&:blank?).join(':')
  end

end
