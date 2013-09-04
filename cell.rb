class Cell
  attr_accessor :live

  def initialize(live)
    @live = live == 1
  end

end