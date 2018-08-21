class Point {
  has Int $.x;
  has Int $.y;
}

class Circle {
  has Point $.center;
  has Int $.radius;     # Use the `.` Twigil for outwardly available attributes

  method area() {
    pi * $!radius ** 2; # Use the `!` Twigil when accessing attributes internally
  }
}

my $circle = Circle.new(
  center => Point.new(x => 5, y => 10),
  radius => 50
);

say $circle.area; # 7853.98...

class Mammal {
  # Methods, Submethods, Attributes for Mammals
}
# `is` Signifies Inheritance
class Dog is Mammal {
  # All Methods and Attributes are included from Mammals
}
role Pet {
  # Methods that apply to Pets
}

# To use roles, use the keyword `does`
my $dog = new Dog;
$dog does Pet;
