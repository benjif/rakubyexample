# Perl 6 is GRADUALLY TYPED — this means you can use OR ignore them, allowing for safety when needed!

# Here are some cool "typing tools" you get with Perl 6:

# `subset` defines a "sub-type" with additional checks
subset NumberString of Str where *.Numeric;

say so "123" ~~ NumberString;
say so "a23" ~~ NumberString;

my $name = 'Geoffrey';

# `:D` is a type constraint for DEFINED values only
say so $name ~~ Str:D; # True

# `:U` is for UNDEFINED values only
say so $name ~~ Str:U; #False

# `:U`, `:D`, `:_`, etc. are examples of Smileys
# `:_` is the default smiley
