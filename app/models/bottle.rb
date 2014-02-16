class Bottle < ActiveRecord::Base
  belongs_to :wine
  belongs_to :store
end
