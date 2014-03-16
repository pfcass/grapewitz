class Variety < ActiveRecord::Base
  validates :name, uniqueness: {case_sensitive: false}, :presence => true
  validates :color, :presence => true
  validates :fizz, :presence => true

  has_many :wines, :dependent => :destroy
  has_many :bottles, :through => :wines

  #constants
  RED = 0
  WHITE = 1
  ROSE = 2

  STILL = 0
  FIZZY = 1

  def icon
    if self.fizz == STILL
      case self.color
        when RED
          'icons/glass-40-red.png'
        when WHITE
          "icons/glass-40-white.png"
        when ROSE
          "icons/glass-40-pink.png"
      end
    else
      case self.color
        when RED
          'icons/flute-40-red.png'
        when WHITE
          "icons/flute-40-white.png"
        when ROSE
          "icons/flute-40-pink.png"
      end
    end
  end

end
