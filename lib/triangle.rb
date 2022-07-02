class Triangle
  attr_reader :a, :b, :c, :kind

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    raise TriangleError if [a, b, c].min <= 0
    raise TriangleError if a + b <= c || b + c <= a || a + c <= b

    @kind = if a == b && b == c then :equilateral
            elsif a == b || a == c || b == c then :isosceles
            else
              :scalene
            end
    @kind
  end

  class TriangleError < StandardError; end
end
