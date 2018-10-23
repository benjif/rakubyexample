## Subroutines
##------------

# Declaration done with the keyword `sub`.

sub shout-greeting { "HELLO!!!" }

say shout-greeting; # HELLO!!!

# The last expression of sub is returned implicitly although it can be done
# explicitly with the keyword `return`. Also a colon is not necessary after
# the last expression in a sub.

sub greeting { return "Hello!" }

say greeting; # Hello!

## Parameters of a subroutine
##---------------------------

# Positional parameters - these are parameters whose meaning is defined by their
# position. Positional parameters are required by default but they can be made
# optional by using a default value OR appending them with a `?`.

sub fullname_v1($fname, $lname) {
    return $fname ~ " " ~ $lname;
}

# say fullname_v1();             # Error
say fullname_v1('Joe', 'Sae');   # 'Joe Sae'

sub fullname_v2($fname = 'John', $lname = 'Doe') {  # parameters made optional
    return $fname ~ " " ~ $lname;                   # with default values
}

say fullname_v2();               # 'John Doe'
say fullname_v2('Jonas', 'Eda'); # 'Jonas Eda'

sub fullname_v3($fname?, $lname?) {  # parameters made optional with `?`
    return $fname ~ " " ~ $lname
    if $fname.defined and $lname.defined;
}

say fullname_v3();                # ' '
say fullname_v3('Ada', 'Ula');    # 'Ada Ula'

# Named parameters - these are parameters whose meaning is defined by their names.
# They're created by prepending `:` to their name. They're optional by default
# but can be made required by appending them with `!`.

sub fullname_v4(:$name, :$surname) {
    return $name ~ " " ~ $surname;
}

say fullname_v4(name => 'Mugen', surname => 'Eta'); # 'Mugen Eta'
say fullname_v4();                                  # ' '

sub fullname_v5(:$name = 'Jane', :$surname = 'Doe') {
    return $name ~ " " ~ $surname;
}

say fullname_v5(name => 'Fuu', surname => 'Ichi');  # 'Fuu Ichi'
say fullname_v5();                                  # 'Jane Doe'

sub fullname_v6(:$name!, :$surname!) { # parameters made required with `!`
    return $name ~ " " ~ $surname;
}

# say fullname_v6();                                  # Error
say fullname_v6(name => 'Jinn', surname => 'Ngan'); # 'Jin Ngan'


## Type constraints
##-----------------

# Typed parameters - The parameters list of a sub can be typed. Besides
# specifying a type, a type constraint can be made stricter by specifying if 
# only defined values are accepted (by using `:D`) or only undefined values 
# (by using `:U`) for a certain type.  

sub multiply(Int $a, Int $b) { $a * $b }

say multiply(5, 3);         # 8
#say multiply('one', 'two'); # Error

sub substract(Int:D $a, Int:D $b) { # accept only defined Ints
    $a - $b
}

substract(10, 15); # -5

sub only-undef-str(Str:U $arg) { # accept only undefined Strs, namely Str
    say $arg
}

say only-undef-str(Str); # Str
say only-undef-str('a'); # Error

# Return type - The return type of a subroutine can be specified by using `-->`
# followed by the type right after the parameters list. Although there are
# other ways of achieving the same thing, this method is the most ubiquitous.

sub add2($a, $b --> Int) { # only allowed to return an Int
    $a + $b
}

say add2(9, 3);     # 12
say add2(1.1, 2.0); # Error

## Parameter traits
##-----------------

## Multiple dispatch
## -----------------

# Subroutines can share the same name but have different signatures. This is 
# achieved by prepending each sub declaration with `multi`.

multi sub add(Int $a, Int $b) { $a + $b; }

multi sub add(Str $a, Str $b) { $a ~ $b; }

say add(1, 2);      # 3
say add('a', 'b');  # ab

# When `multi` is used, `sub` can be omitted:

multi fact(0 --> 1) { }
multi fact(Int $n --> Int) {
    return $n * fact($n-1)
}

say fact(3); # 6

## Anonymous subroutines
##----------------------

# A nameless or anonymous, as they call it, is created by storing a `sub`
# with its parameters list and body in a variable.

my $add = sub (Int:D $x, Int:D $y) { $x + $y }

say $add(10, 15); # 25

# An anonymous sub can also be created using a regular function declaration by
# storing it in a variable. In this manner, the function can be called both by
# its name and the handle containing it.

my $name-it = sub name-it(Str $string) { say $string }

$name-it('dog'); # dog
name-it('cat');  # cat

# The `anon` keyword can be used to create an anonymous subroutine from a
# regular one. However, this forbids calling the sub by its name.

my $hello = anon sub hello(Str $name) { say "Hello, $name!" }

$hello('Joe');   # works fine
# hello('Sachio'); # error!

# Instead of anonymous subs, you can utilize anonymous block of codes called 
# pointy blocks. They are declared with an arrow `->` and their parameters lists
# must be listed without parentheses.

my $repeat-n = -> $str, $n { say $str x $n }

$repeat-n('p6', 3); # p6p6p6

# Blocks can even be more succint by dropping the arrow and using self-declared
# positional parameters (placeholders) with the twigil `$^` instead.

my $blocky1 = { say "$^a : $^b" }
my $blocky2 = { say "$^b : $^a" }

$blocky1(3, 7);     # '3 : 7'
$blocky2('A', 'Z'); # 'Z : A'

my $alt-repeat-n = { say $^a x $^b }

$alt-repeat-n('p6', 3); # 'p6p6p6'
