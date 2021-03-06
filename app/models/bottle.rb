class Bottle < ActiveRecord::Base
  include ActionView::Helpers
  include Filterable

  belongs_to :wine
  belongs_to :store
  belongs_to :user

  validates :wine_id, :store_id, presence: true
  validates :rating, numericality: {only_integer: true,
                                    greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 5}

  after_initialize :init

  # CONSTANTS
  HIDDEN = 0
  VISIBLE_TO_FRIENDS = 0x1
  VISIBLE_TO_ALL = 0x2

  scope :region, -> (region) { joins(:wine).where("wines.region_id = ?", region) }
  scope :variety, -> (variety) { joins(:wine).where("wines.variety_id = ?", variety) }
  scope :brand, -> (brand) { joins(:wine).where("wines.brand_id = ?", brand) }
  scope :store, -> (store) { where store_id: store }

  scope :color, -> (color) { joins(wine: :variety).where("varieties.color = ?", color) }
  scope :fizz, -> (fizz) { joins(wine: :variety).where("varieties.fizz = ?", fizz) }

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
    str = to_summary
    str += cost
  end

  def to_summary
    str = "Got #{pluralize(self.quantity, 'bottle')} from #{self.store.name} "
  end

  def cost
    if self.price && self.list_price
      "for #{number_to_currency(self.price)} (list #{number_to_currency(self.list_price)})"
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

  def visible?(id)
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

  def self.visible_bottles(cur_user, wine_id=nil)
    if wine_id == nil
      @bottles = Bottle.where("visibility != 0 OR (visibility = 0 AND user_id = ?)", cur_user)
    else
      @bottles = Bottle.where("wine_id = ? AND
          (visibility != 0 OR (visibility = 0 AND user_id = ?))", wine_id, cur_user)
    end
  end


end
