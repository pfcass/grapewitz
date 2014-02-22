class Bottle < ActiveRecord::Base
  include ActionView::Helpers

  belongs_to :wine
  belongs_to :store

  validates :wine_id, :store_id, presence: true
  validates :rating, numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 5 }

  after_initialize :init

  def init
    self.quantity ||= 1
    self.purchased_on ||= Time.now
    self.rating ||= 3
  end

  def to_label
    str = "Got #{pluralize( self.quantity, 'bottle')} from #{self.store.name} "
    if self.price != NIL
      str += "@ #{number_to_currency( self.price )} "
    end
    str += " purchased on #{self.purchased_on} with rating of #{self.rating}."
  end
end
