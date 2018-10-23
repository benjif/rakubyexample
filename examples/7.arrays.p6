## Lists and Arrays
#------------------

# Lists and arrays are collections of items. However lists and arrays differ 
# in that lists are ordered and inmutable collections of items while arrays 
# are mutables. Furthermore, lists are sort of ephemeral since they cease to
# exist as soon as they been used while arrays tend to persist throughout the
# program.

# Create a list by enumerating its values, separated by commas. Optionally
# enclose them in parentheses for delimitation. In the REPL:

#> 2, 3, 5
#(2 3 5)
#> (2, 3, 5) # same as before
#(2 3 5)
#> for 2, 3, 5 { print $_ }
#235

# To create an array, assign a collections of items to a variable prefixed with
# the sigil @. All the following accomplish the same thing, that is, creating
# an array:

my @bin-numerals = 0, 1;
my @dec-numerals = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
my @vowels = <a e i o v>; # use <> for items without spaces in them

# Arrays/lists are 0-indexed and items are accessed/updated by using the
# square bracket operator `[...]`:
say @bin-numerals[0]; # 0 
say @bin-numerals[1]; # 1
say @vowels[0];       # 'a'
say @vowels[4];       # 'v'. Oops, not a vowel!
@vowels[4] = 'u';     # assignment 
say @vowels[4];       # 'u'. This is the right vowel!

# Arrays can host values of different types:
my @mix-array = 'A', 12, 1E2;

# Or you can constraint their type so as to accept only a specific type:
my Int @only-integers = 1, 2, 3;

# Arrays can have fixed sizes. Specify it inside the square bracket during 
# declaration/initialization:
my @earth-moons[1];  # accepts only one element
@earth-moons[0] = 'The Moon';

my @mars-moons[2] = <Rhobos Deimos>;

# Arrays/lists can be nested:
my @nested-array = (1, 2, 3), ('a', 'b', 'c');
for @nested-array { say $_ }; # (1, 2, 3) (a b c) 

# Besides one-dimensional, arrays can be multidimensional (matrices). What would
# be columns are separated by ; inside of what would be rows:
my @students = ['Bob'; 75], ['Alice'; 80], ['Era'; 93]; 
say @students[0];     # [Bob 75]
say @students[0][0];  # 'Bob'
say @students[0][1];  # 75
say @students[2][0];  # 'Era'
say @students[2][1];  # 93

## Some methods
##-------------

my @planets = 'Earth';

# `elems` - counts the number of items of an array/list:
say @planets.elems; # 1
say elems @planets; # 1

# `push` - adds a new item to the end of the array.
@planets.push('Mars');
push @planets, 'Mars'; # same thing

# `pop` - removes an item from the end and return it.
@planets.pop;
pop @planets; # same thing

# `append` - add new item(s) to the end of the array.
@planets.append(<Mars Jupiter>);
append @planets, ('Saturn', 'Uranus', 'Neptune'); # similar thing

# 'unshift` - adds a new item to the beginning of the array.
@planets.unshift('Venus');
unshift @planets, 'Venus'; # same thing

# `shift` - removes an item from the beginning of the array and returns it.
@planets.shift;
shift @planets; # same thing

# `prepend` - add new item(s) to the beginning of the array.
@planets.prepend('Venus');
prepend @planets, 'Mercury';  # similar thing

# `head` - returns first n numbers of items from an array
say @planets.head;    # (Mercury)
say @planets.head(2); # (Mercury Venus)

# `tail` - returns last n numbers of items from an array
say @planets.tail;    # (Neptune)
say @planets.tail(2); # (Uranus Neptune)

## List comprehensions
##--------------------

my @numbers = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10;

# Statement modifiers and blocks can be combined to create list comprehensions.
my @squares = ($_ ** 2 for @numbers);

# Conditionals can be applied too.
my @squared-primes = ($_ ** 2 if $_.is-prime for @numbers);

# Nested comprehensions can be achieved in different ways. This one uses the 
# cross product operator `X`:

my @letters-nums = ([$_[0], $_[1]] for <A B> X <1 2>); # ([A 1] [A 2] [B 1] [B 2])

