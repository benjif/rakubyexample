## Hashes
##-------

# Hashes are like an unordered arrays, where each value is associated 
# with a string (known as a key), rather than a positional index.

# Hashes use the % sigil and are created by enumerating pairs of keys and
# values.

my %person = 
    name => 'Andreas',
    lastname => 'Stoa',
    age => 41;

say %person{'name'};           # accessing an element
%person{'age'} = 25;           # updating the value of an element
%person{'country'} = 'Greece'; # adding a new pair

# All values of a hash can have type constraints.
my Int %binaries = zero => 0, one => 1;

my %booleans of Bool = t => True, f => False; # similar thing

# The keys of a hash can also have type constraints.
my %doubles{Int} of Int; # constraining both keys and values

say %doubles{21} = 42;

## Some methods
##-------------

my %natural-satellites = ( # during assignment, pairs can be sorrounded by parens
    mercury => 0,
    jupiter => 79,
    venus   => 0, 
    saturn  => 62,
    earth   => 1,
    nepture => 14,
    mars    => 2,
    uranus  => 27
);


# `keys` - returns a list of keys of the hash.
my @planets = %natural-satellites.keys;
say @planets; # (earth uranus nepture saturn venus mercury jupiter mars)

# `values` - returns a list of values of the hash.
my @satellites = %natural-satellites.values;
say @satellites; # (1 27 14 62 0 0 79 2) 

# `kv` - returns a list of both keys and values.
say %natural-satellites.kv; # (earth 1 uranus 27 nepture 14 saturn 62 venus 0
                            # mercury 0 jupiter 79 mars 2)

# `pairs` - returns a list of pairs (key/value).
say %natural-satellites.pairs; # (earth => 1 uranus => 27 nepture => 14
                               # saturn => 62 venus => 0 mercury => 0
                               # jupiter => 79 mars => 2)

# `antipairs` - returns a list of inverted pairs (value/key).
say %natural-satellites.antipairs; # (1 => earth 27 => uranus 14 => nepture
                                   # 62 => saturn 0 => venus 0 => mercury
                                   # 79 => jupiter 2 => mars)

# `elems` - returns number of pairs in the hash.
say %natural-satellites.elems; # 8

## Hash comphrehensions
##---------------------

my @numbers = 1, 2, 3, 4, 5;
my @letters = <A B C D E>;

# Postfix form of for and blocks can be combined to make list comphrehensions.
my %square-nums = %( {$_ => $_**2} for @numbers ); # %() is an alternative way of
                                                   # creating a hash.
                                                   
say %square-nums;      # {1 => 1, 2 => 4, 3 => 9, 4 => 16, 5 => 25}

# Conditionals can be applied too.

my %square-even-nums = %( {$_ => $_**2} if $_ %% 2 for @numbers );
my %square-even-nums = %( {$_ => $_**2} if $_ !%% 2 for @numbers );

say %square-even-nums; # {2 => 4, 4 => 16}
say %square-odd-nums;  # {1 => 1, 3 => 9, 5 => 25}

# To obtain a one-to-correspondence, use the zip operator `Z`.
my @letters-nums =  %( {$_[0] => $_[1]} for @letters Z @numbers );

say @letters-nums;     # {A => 1, B => 2, C => 3, D => 4, E => 5}

# Or using the flat function.
my @letters-nums1 = %( flat @letters Z @numbers );

say @letters-nums1;    # {A => 1, B => 2, C => 3, D => 4, E => 5}
 

