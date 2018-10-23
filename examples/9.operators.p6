# Besides the regular arithmetic operators, here are some useful
# Perl 6 Operators!

# String concatenation (~) & string repetition (x)
say 'w' ~ 'o'; # wo
say 'wo' x 3;  # wowowo

# List repetition (xx)
say [1, 2] xx 2; # ([1 2] [1 2])

# Greatest common divisor(gcd) & least common multiple (lcm)
say 27 gcd 18; # 9
say 35 lcm 10; # 10

# Perl 6 has full unicode support, here are some notable versions of
# Unicode in Perl 6 operators:

say 5 ÷ 2;  # 2.5
say 5 / 2;

say 5 × 2;  # 10
say 5 * 2;

say 5 ≤ 2;  # False
say 5 <= 2;

say 5²;     # 25
say 5 ** 2;

# Alongside tons more (e.g. ∈ ∉ ∋ ∌ ⊂ ⊄ ⊃ ⊅ ⊆ ⊈ ⊇ ⊉ ≼ ≽ o ∘ ∩ ⊍ ⊖ ≠)

# Zip Operator (Z) and quote-words (<>)
my @z = <a b c> Z (1, 2, 3); # ((a 1) (b 2) (c 3))

my @a = 'a', 'b', 'c';
my @b = 1, 2, 3;

my %h = @a Z=> @b; # (a => 1, b => 2, c => 3)

# Cross operator (X)
say @x = (1, 2) X <a b>; # ((1 a) (1 b) (2 a) (2 b))

# Reduction operator ([])
say [+] 1, 2, 3; # 1 + 2 + 3 = 6
say [*] 1..3;    # (1)(2)(3) = 6. That sweet factorial easier than ever!

# XOR Operators (^^, xor, +^)
say False ^^ True;      # True
say False xor True;     # True; this has looser precedence
say 1 +^ 0;             # 1; integer XOR

# Range operator
print $_ for 1..5;   # 12345
print $_ for 1^..5;  # 2345
print $_ for 1..^5;  # 1234
print $_ for 1^..^5; # 234

# Sequence operator
print $_ for 1...5;  # 12345
print $_ for 5...1;  # 54321


# Slurpy arguments - flattens list/array
sub slurpee( |args ){
  say args.perl
}

slurpee(<a b c d>, {e => 3}, 'e' => 'f' => 33) # \(("a", "b", "c", "d"), {:e(3)}, :e(:f(33)))

# And all of your OWN Operators (all variants: infix, postfix, circumfix, prefix, etc)

# factorial
multi infix:<:=:>($val1 is rw, $val2 is rw) { ($val1, $val2) .= reverse }
my ($x, $y) = (0, 9);
$x :=: $y;
say $x, $y; # 9 0

# swap values
sub postfix:<!>(Int $x where { $x >= 0 }) { [*] 1..$x };
say 6!; # 720

