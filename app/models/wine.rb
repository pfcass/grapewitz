class Wine < ActiveRecord::Base
  belongs_to :brand
  belongs_to :variety
  has_many :bottles, :dependent => :destroy
  has_many :stores, :through => :bottles, :dependent => :destroy

  #add_index :categories_posts, [ :category_id, :post_id ], :unique => true, :name => 'by_category_and_post'

  def wine_name
    [ brand.name, variety.name ].reject(&:blank?).join(':')
  end

end
