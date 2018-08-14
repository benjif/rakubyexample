sub celsius-from-fahrenheit($degrees) {
  ($degrees - 32) * 5/9; # You don't have to use `return` for one line subroutines
}

say celsius-from-fahrenheit(100); # 100 °F ≃ 37.777778 °C

# Subroutine overloading with multi
multi add(Int $a, Int $b) { $a + $b; }

# Same name, different signature
multi add(Str $a, Str $b) { $a ~ $b; }

say add(1, 2); # 3
say add('a', 'b');  # ab

# `:` makes the argument named, `:$lang` has a default value of 'english'
# `!` following a named argument makes it mandatory; shout it!
sub greet(Str :$name!, Str :$lang = 'english') {
  given $lang {
    when 'english' {
      say "Hello $name.";
    }
    when 'spanish' {
      say "Hola $name.";
    }
    default { say "I'm sorry $name, I don't know that language."; }
  }
}

greet(name => 'Abraham'); # Hello Abraham.
greet(name => 'Miguel', lang => 'spanish'); # Hola Miguel.
greet(name => 'Sergei', lang => 'russian'); # I'm sorry Sergei, I don't know that language.

# `?` following an argument makes it optional
sub optional($arg?) {
  $arg.defined;
}

say so optional(1); # True
say so optional; # False
