use v6;
use Text::VimColour;

my $css;

# Clean previous files
if 'html'.IO.d {
  for 'html'.IO.dir -> $f {
    $f.IO.unlink;
  }
} else {
  mkdir 'html';
}

for 'examples'.IO.dir -> $path {
  my $out = $path.Str;
  $out .= subst('examples', 'html');
  $out .= subst('.p6', '.html').IO;
  my $highlight = Text::VimColour.new(
    lang => 'perl6',
    in => $path.Str
  );
  $css = $highlight.css if !?$css;
  spurt $out, $highlight.html;
}

spurt 'css/code.css', $css.subst(/'<!--' || '-->'/, '', :g).subst('text-decoration: underline;', '', :g);
