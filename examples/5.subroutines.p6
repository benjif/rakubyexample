sub celsius-from-fahrenheit($degrees) {
  ($degrees - 32) * 5/9; # You don't have to use `return` for one line subroutines
}

say celsius-from-fahrenheit(100); # 100 °F ≃ 37.777778 °C

multi add(Int $a, Int $b) {
  $a + $b;
}

multi add(Str $a, Str $b) { # Same name, different types
  $a ~ $b;
}

say add(1, 2);      # 3
say add('a', 'b');  # ab
