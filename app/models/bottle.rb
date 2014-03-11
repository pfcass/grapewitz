class Bottle < ActiveRecord::Base
  include ActionView::Helpers

  belongs_to :wine
  belongs_to :store
  belongs_to :user

  validates :wine_id, :store_id, presence: true
  validates :rating, numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 5 }

  after_initialize :init

  # CONSTANTS
  HIDDEN             = 0
  VISIBLE_TO_FRIENDS = 0x1
  VISIBLE_TO_ALL     = 0x2

  def inspect
    "#{self.wine.brand.name}.#{self.wine.variety.name}:  #{self.user.email}:  #{self.quantity}"
  end

  def init
    self.quantity ||= 1
    self.purchased_on ||= Time.now
    self.rating ||= 0
    self.visibility ||= VISIBLE_TO_ALL
  end

  def to_label
    str = "Got #{pluralize( self.quantity, 'bottle')} from #{self.store.name} "
    str += cost
    str += " purchased on #{self.purchased_on} with rating of #{self.rating}."
  end

  def cost
    if self.price && self.list_price
      "for #{number_to_currency(self.price)} (list )#{number_to_currency(self.list_price)}"
    elsif self.price
      "for #{number_to_currency(self.price)}"
    else
      ""
    end
  end

  # override the setter to strip a dollar sign from the input
  def list_price=(value)
    set_price(value, :list_price)
  end

  def price=(value)
    set_price(value, :price)
  end

  def set_price(value, tag)
    value = value.to_s.tr('$', '').to_f
    if value > 0.0
      write_attribute(tag, value)
    end
  end

  def visible?( id )
    if self.user_id == id
      # mine always show
      true
    elsif self.visibility == HIDDEN
      # not mine, but hidden
      false
    else
      # otherwise, count it
      true
    end
  end

end
