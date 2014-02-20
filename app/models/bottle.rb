class Bottle < ActiveRecord::Base
  belongs_to :wine
  belongs_to :store

  #validates :store_id, presence: true

  before_save :set_defaults

  def set_defaults
    self.quantity = 1
  end
end
