#--- classes ---#
class DefaultClass 
  attr-reader :symbol1
  attr-writer :symbol2
  attr-accessor :symbol3
  
  def initialize(symbol1=0)
    @symbol1 = symbol1
    @symbol2 = symbol2
    @symbol3 = symbol3
  end

end

#--- methods ---#
def func 
  default = DefaultClass.new(1)
end