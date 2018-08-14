# Scalar ($)
my $name = 'Bob';
my Int $age = 12; # You can specify a type for the variable container

# Positional (@)
my @animals = 'Cow', 'Pig', 'Horse', 'Duck';
my @animals = <Cow Pig Horse Duck>; # Same but using quote-words (<>)

# Associative (%)
my %planet-mass = Earth => 1, Mars => 0.107, Jupiter => 318, Pluto => 0.002;
my %planet-mass = :Earth(1), :Mars(0.107), :Jupiter(318), :Pluto(0.002); # Same but using colon pairs

# Callable (&)
my &say-hello = sub { say "hello!" };
&say-hello();

# You can also have constants!
constant $earth-to-sun = 92960000;
