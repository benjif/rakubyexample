if True {
  say "This will happen!";
}

say "This will happen!" if True;
say "This will happen!" unless False; # Unless is the same as `if !(condition) { }`

# Numerical Comparisons (==, !=, <=, >=, etc.)
say "It's greater!" if 2 > 1;

# String Comparisons (eq, ne, gt, ge, lt, le, etc.)
my $name = "Stanley";
say "Same name!" if $name eq "Stanley";

# Smart Matching (~~)
say so "Hello Stanley" ~~ Str;  # Type Comparisons
say so "Hello Bob" ~~ /Bob/;    # Regular Expressions Matching
