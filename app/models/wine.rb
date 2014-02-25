class Wine < ActiveRecord::Base
  validates :brand_id, uniqueness: { scope: :variety_id, message: 'of this variety already exists' }

  belongs_to :brand
  belongs_to :variety
  has_many :bottles, :dependent => :destroy
  has_many :stores, :through => :bottles, :dependent => :destroy

  acts_as_commentable

  attr_accessor :note

  def wine_name
    [ brand.name, variety.name ].reject(&:blank?).join(':')
  end

  def num_bottles( show_all, current_user_id )
    num = 0
    bottles.each do |b|
      if show_all || b.user_id == current_user_id
        num += b.quantity
      end
    end
    num
  end

end
