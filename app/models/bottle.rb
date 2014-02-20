class Bottle < ActiveRecord::Base
  belongs_to :wine
  belongs_to :store

  #validates :store_id, presence: true

  after_initialize :init

  def init
    self.quantity ||= 1
    self.purchased_on ||= Time.now
  end
end
