class Wine < ActiveRecord::Base
  validates :brand_id, uniqueness: { scope: :variety_id, message: 'of this variety already exists' }
  validates :region_id, :presence => true
  validates :color, :presence => true
  validates :fizz, :presence => true

  belongs_to :brand
  belongs_to :variety
  belongs_to :region

  has_many :bottles, :dependent => :destroy
  has_many :stores, :through => :bottles, :dependent => :destroy

  acts_as_commentable

  attr_accessor :note

  #constants
  RED = 0
  WHITE = 1
  ROSE = 2

  STILL = 0
  FIZZY = 1

  def wine_name
    [ brand.name, variety.name ].reject(&:blank?).join(' ')
  end

  def name
    wine_name
  end

  def num_bottles( show_all, current_user_id )
    num = 0
    bottles.each do |b|
      if b.visible?(current_user_id) == false
        next
      end

      if show_all || b.user_id == current_user_id
        num += b.quantity
      end
=begin

=end
    end
    num
  end

end
