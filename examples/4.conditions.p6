## if, else, elsif, unless, etc. - testing for truthness
#------------------------------

# if
if True { say 'This will happen!'; }
say 'This will happen!' if True; # statement modifier syntax

# if/else
if False { say "This won't happen!";       }
else     { say "This will happen though!"; }

# if/elsif/else
if False   { say "This won't happen!";         }
elsif True { say "This will happen though!";   }
else       {   say "This could've happened!";  }

# unless - equivalent to `if !(condition) {}`
unless False { say "This will certainly happen"; }
say 'This will happen!' unless False; # statement modifier syntax

## with, orwith, without - testing for definedness
#-----------------------

# with - unlike `if` that tests for truthness, `with` tests for definedness
my $falsey = "";

with $falsey { say "This will print";  }
say "This will print" with $falsey; # statement modifier form

# orwith - similar to `elsif` but for definedness
with Nil { say "This won't print"; }
orwith 1 { say "This will print";  }

# without - similar to `unless` but for definedness
my $answer = Any;
without $answer { say "This will print!"; }
say "This will print even if " without $answer; # statement modifier form

## Numerical comparisons (==, !=, <=, >=, etc.)
##----------------------
my ($a, $b, $c) = (1, 2, 1);

say "$a is less than $b"                   if $a < $b;
say "$a is less than or equal to $b"       if $a <= $b;
say "$b is greater than $a"                if $b > $a;
say "$b is greater than or equal to $a"    if $b >= $a;
say "$a is equal to $c"                    if $a == $c;
say "$b is not equal to $c"                if $b != $c;

# chained comparison
say "$a is greater than 0 and less than 2" if 0 < $a < $b;

## String comparisons (eq, ne, gt, ge, lt, le, etc.)
##-------------------
my ($n1, $n2, $n3) = ('Sergey', 'Stanley', 'Marcus');

say "$n1 comes before $n2"     if $n1 lt $n2;
say "$n2 comes after $n1"      if $n2 gt $n1;
say "$n2 is not equal to $n1"  if $n2 ne $n1;

# chained comparison
say "$n1 comes after $n3 and before $n2" if $n3 lt $n1 lt $n2;

## Ternary operator (condition ?? opt1 !! opt2)
##-----------------
say $n2 eq 'Stanley' ?? "It's Stanley!" !! 'Not Stanley';

my $n = 7;
my $p = $n.is-prime ?? "Prime" !! "Composite";

say $p;

## Smart matching (~~)
##-------------------
say 'Hello Stanley' ~~ Str;  # Type Comparisons
say so 'Hello Bob' ~~ /Bob/; # Regular Expressions Matching

# Canonical Equivalence / Deep Equality (eqv)
say (1, 2) eqv (1, 3);
