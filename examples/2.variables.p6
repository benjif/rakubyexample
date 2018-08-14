# Sigils ($, @, %, &)

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

# Two at once? No problem!
my ($a, $b) = (1, 2);

# Twigils influence the scoping of a variable (!, *, ., :, <, =, ?, ^, ~)
my $*dynamic = 1; # Dynamic-scoped variables
say $?FILE;       # Outputs what file this is in

# Declarators (my, our, has, anon, state, augment, supersede, let, temp)

my $a = 1;  # Lexically-scope name
our $a = 1; # Package-scoped name
has $a = 1; # Attribute name (for classes)
