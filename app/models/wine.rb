class Wine < ActiveRecord::Base
  belongs_to :brand
  belongs_to :variety
end
