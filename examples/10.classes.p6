## Classes
#---------

class Point {
    has Str $!name;   # twigil `!` declares a private attribute.
    has Int $.x;      # twigil `.` declares an outwardly available attribute 
    has Int $.y;      # which is equivalent to a private attribute with
                      # a read-only accesor generated automatically.

    # this is a private method accesible only within the class. Note
    # the `!` in front of its name.
    method !to-center {
        sqrt($!x ** 2 + $!y ** 2); # use the `!` to access/assign to 
                                   # attributes internally
    }
    
    # this is a public method accesible
    # from outside the class.
    method distance-from-center {
        self!to-center;           # private methods must be invoked using
                                  # `!` on `self` or explicit invocant.
    }

    # this method is also public. 
    method set-name(Str $name) {
        $!name = $name;
    }

}

# Instantiate a class with the default constructor `new`
# by providing named arguments.
my $point = Point.new(x => 3, y => 4);

# Private attributes cannot be set with `new` so here it's done after the 
# object construction. Nonetheless, this can be achieved during object
# construction by different mechanisms.
$point.set-name('Point 1');

# Calling a method on the instance object is done with dot notation.
say $point.distance-from-center;

# As mentioned previously, free accesor methods are provided whenever
# attributes are declared with the `.` twigil. So:
say $point.x;
say $point.y;


class Circle {
    has Point $.center;
    has Int $.radius = 1; # attributes can have default values

    method area {
        pi * $!radius ** 2;
    }
}

my $circle = Circle.new(
    center => Point.new(x => 5, y => 10),
    radius => 50
);

say $circle.area; # 7853.98...

## Inheritance - achieved through the use of the keyword `is`.
##------------

class Mammal {
    has $.name;
    has $.nourishment-type = "milk from mother's mammary glands";

    method sound {
        say "mammal makes sound";
    }
    # And more methods, submethods, attributes common to mammals
}


## Roles - a role is declared with `role` and applied with the keyword `does`.
##-------
role Pet {
    method is-companion { True }
    
    # And other methods that apply to Pets
}

role Shepherd {
    method does-herd { True }

    # And other methods that apply to Shepherds
}

## Inheritance and roles: Application
##-----------------------

class Dog is Mammal does Pet does Shepherd {
    has $.name = 'Doggy';

    # sound specific to dogs
    method sound {
        say "woof woof";
    }
    # And more methods, submethods, attributes common to Dogs
}

class Cat is Mammal does Pet {
    has $.name = 'Cattie';

    # sound specific to cats
    method sound { 
        say "meow";
    }
    # And more methods, submethods, attributes common to Cats
}

my $cornie = Dog.new(name => 'Cornie');
say $cornie.name;   # 'Cornie'
$cornie.sound;      # 'woof woof'

my $prosia = Cat.new(name => 'Prosia');
say $prosia.name;   # 'Prosia'
$prosia.sound;      # 'meow'

if $cornie.is-companion { 
    my $output = $cornie.name ~ " is a pet.";
    $output   ~= " And is herding the sheep!" if $cornie.does-herd;

    say $output;
}

if $prosia.is-companion { 
    say $prosia.name, " is a pet";
}
