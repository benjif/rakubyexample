# For loops
my @a = 1, 2, 3;

for @a -> $i {
  say $i;
}

say $_ for @a;

my %h = a => 1, b => 2;

# `.kv` returns key and value
for %h.kv -> $k, $v { # Looping through hashes
  say "$k : $v";
}

# C style loops
loop (my $i = 0; $i < 10; $i++) {
  say $i;
}

# While / Until loops
my $x = 1;

while $x < 4 { # While loops work while the expression is TRUE
  print $x++;
}

$x = 1;

print $x++ while $x < 4;

$x = 1;

until $x > 3 { # Until loops work while the expression is FALSE
  print $x++;
}
