## for loops - loop over a collection of things

# arrays/lists/ranges/sequences
my @a = 1, 2, 3;

for @a { say $_; }             # using the topic variable $_

for @a -> $i { say $i; }       # using a pointy block for explicit variable

say $_ for @a;                 # using the statement modifier form

for 0..3 -> $i { say $i; }     # looping over a range (both extremes are included)

for 0...3 -> $i { say $i; }    # looping over a sequence

for 3...0 -> $i { say $i; }    # unlike the range operator, the sequence operator
                               # can count down

# hashes
my %h = a => 1, b => 2, c => 3;

for %h.kv -> $k, $v { say "$k : $v";     }  # looping over keys and values

for %h.keys -> $k   { say "Key: $k";     }  # looping over keys

for %h.values -> $v { say "Value: $v";   }  # looping over keys

for %h -> $pair     { say "Pair: $pair"; }  # looping over key/value pairs


## C style loops - use an initialized variable, with condition and accumulator
loop (my $i = 0; $i < 10; $i++) {
    say $i;
}

# infinite loop - use `loop` without parenthesis 
my $j = 0;
loop {                   # this would loop forever if it wasn't for the `last`
    say $j++;            # statement
    last if $j == 10;
}

## while / until loops
my $x = 1;

while $x < 4 {           # `while` loops work while the expression is TRUE
    print $x++;
}

$x = 1;
print $x++ while $x < 4; # statement modifier form

$x = 1;
until $x > 3 {           # Until loops work while the expression is FALSE
    print $x++;
}

$x = 3;
print $x++ until $x > 3; # statement modifier form
