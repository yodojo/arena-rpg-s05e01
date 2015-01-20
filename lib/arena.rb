class Arena
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def esta_dentro?(x, y)
    x.between? 1, @width and y.between? 1, @height	
  end	
end
 