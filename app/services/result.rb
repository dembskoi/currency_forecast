class Result
  attr_reader :calculation

  def initialize(calculation)
    @calculation = calculation
  end

  def all
    []
  end
end
