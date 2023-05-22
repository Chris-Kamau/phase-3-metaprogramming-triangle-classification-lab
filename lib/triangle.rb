class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    validate_triangle
  end

  def kind
    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    sides = [@side1, @side2, @side3]
    if sides.any? { |side| side <= 0 } || (sides[0] + sides[1] <= sides[2]) || (sides[1] + sides[2] <= sides[0]) || (sides[2] + sides[0] <= sides[1])
      raise TriangleError, "Invalid triangle!"
    end
  end

  class TriangleError < StandardError
  end
end
