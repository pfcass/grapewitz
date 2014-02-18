class Wine < ActiveRecord::Base
  #validates :brand_id, uniqueness: { :scope => :variety_id }
  #validates :variety_id, uniqueness: { :scope => :brand_id }

  belongs_to :brand
  belongs_to :variety
  has_many :bottles, :dependent => :destroy
  has_many :stores, :through => :bottles, :dependent => :destroy

  def wine_name
    [ brand.name, variety.name ].reject(&:blank?).join(':')
  end

  def self.find_name( brand_id, variety_id )
    Brand.find(brand_id).name + ' ' + Variety.find(variety_id).name
  end

end
