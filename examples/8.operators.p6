# Here's some Perl 6 Operators!

# String Concatenation (~) & String Repetition (x)
say 'w' ~ 'o' x 5; # wooooo

# List Repetition (xx)
say [1, 2] xx 2; # ([1 2] [1 2])

# Greatest Common Divisor & Least Common Multiple (gcd, lcm)
say 27 gcd 18; # 9
say 35 lcm 10; # 10

# Perl 6 has full unicode support, here's some notable options of Unicode in Perl 6 Operators:

say 5 ÷ 2; # 2.5
say 5 / 2;

say 5 × 2; # 10
say 5 * 2;

say 5 ≤ 2; # False
say 5 <= 2;

say 5²; # 25
say 5 ** 2;

# Alongside tons more (e.g. ∈ ∉ ∋ ∌ ⊂ ⊄ ⊃ ⊅ ⊆ ⊈ ⊇ ⊉ ≼ ≽ o ∘ ∩ ⊍ ⊖ ≠)

# Zip Operators (Z)
# Quote-words (<>)
my @l = <a b c> Z (1, 2, 3); # ((a 1) (b 2) (c 3))

my @a = 'a', 'b', 'c';
my @b = 1, 2, 3;

my %h = @a Z=> @b; # (a => 1, b => 2, c => 3)

# Reduction Operators
say [+] 1, 2, 3; # 1 + 2 + 3 = 6

# XOR Operators (^^, xor, +^)
say False ^^ True; # True
say False xor True; # True; this has looser precedence
say 1 +^ 0; # 1; integer XOR

# Range Operators
print $_ for 1..5; # 12345
print $_ for 1^..5; # 2345
print $_ for 1..^5; # 1234
print $_ for 1^..^5; # 234

# Slurpee Arguments - Flattens Items into Argument List
sub slurpee( |args ){
  say args.perl
}

slurpee(<a b c d>, {e => 3}, 'e' => 'f' => 33) # \(("a", "b", "c", "d"), {:e(3)}, :e(:f(33)))

# AND all of your OWN Operators (all variants: infix, circumfix, prefix, etc)

sub postfix:<!>(Int $x where { $x >= 0 }) { [*] 1..$x };
say 6!; # 720
