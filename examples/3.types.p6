# Perl 6 is GRADUALLY TYPED which allows for safety AND the ability to
# ignore explicit typing!

## Subsets
##--------

# The`subset` keyword defines a "sub-type" with additional checks.
subset IntString of Str where *.Int !~~ Failure;

say '123' ~~ IntString; # True
say 'a23' ~~ IntString; # False

subset DecimalFactorion of Int where { $_ == [+] $_.comb.map: { [*] 1..$_ } };

my DecimalFactorion $n = 145; # type check works
my DecimalFactorion $m = 25;  # type check fails

## Type object constraints
##------------------------
my $name = 'Geoffrey';

# `:D` is a type constraint for DEFINED values only.
say $name ~~ Str:D; # True

# `:U` is for UNDEFINED values only.
say $name ~~ Str:U; # False

# `:U`, `:D`, `:_`, etc. are examples of smileys. `:_` is the default smiley.
say 'aa' ~~ Str:_;  # True
say  Str ~~ Str:_;  # True

# Perl 6 also allows NATIVE TYPES; these start with a lowercase letter
# (ex. str, uint64, num64, etc). To use them, include the pragma 
# `use NativeCall;` at the top of your program!

my int32 $i = 50; # I'm a 32-bit integer!

## Enumerations
##-------------

# The `enum` keyword declares an enumeration of constant key-value-pairs with
# an associated type.
enum TrafficLight <Red Green Yellow>;

# Perl 6 assigns increasing integer values to each name.
say Red + Green + Yellow;     # 3

# If the values are meaningful, they can be specified explicity.
enum BoilingPoints (Celsius => 100, Fahrenheit => 212, Kelvin => 373);

say BoilingPoints.enums;      # Map.new((Celsius => 100, Fahrenheit => 212,
                              #        Kelvin => 373))
say Celsius ~~ BoilingPoints; # True
say Celsius.^name;            # BoilingPoints
say Celsius.value;            # 100


