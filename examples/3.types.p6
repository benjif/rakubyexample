# Perl 6 is GRADUALLY TYPED — allowing for safety AND the ability to ignore explicit typing!

# `subset` defines a "sub-type" with additional checks
subset NumberString of Str where *.Numeric;

say so "123" ~~ NumberString; # True
say so "a23" ~~ NumberString; # False

my $name = 'Geoffrey';

# `:D` is a type constraint for DEFINED values only
say so $name ~~ Str:D; # True

# `:U` is for UNDEFINED values only
say so $name ~~ Str:U; #False

# `:U`, `:D`, `:_`, etc. are examples of Smileys
# `:_` is the default smiley

# Perl 6 also allows NATIVE TYPES; these start with a lowercase letter (ex. str, uint64, num64, etc)
# To use these, include a `use NativeCall;` at the top of your program!
my int32 $i = 50; # I'm a 32-bit integer!
