use v6;

use Cro::WebApp::Template;

mkdir 'docs' if !'docs'.IO.d;

# Cleanup previous runs
for 'docs'.IO.dir -> $f {
  $f.IO.unlink;
}

for 'images'.IO.dir -> $f {
  copy($f, 'docs/' ~ $f.basename);
}

my $css = slurp 'css/code.css';
$css ~= slurp 'css/style.css';

my @titles;
('html'.IO.dir).map: {
  @titles.push: ($_.basename).Str.subst('.html', '');
}

my @t-index-title;
for @titles -> $t {
  @t-index-title.push: $t.substr(^1) => $t;
}

my @index-title = @t-index-title.sort: {.key};

for 'html'.IO.dir -> $f {
  my $out = render-template 'templates/gh.crotmp', {
    links => @index-title,
    e => slurp $f,
  };
  spurt "docs/{($f.IO.basename.Str.substr(^1))}.html", $out;
}

my $out = render-template 'templates/gh.crotmp', {
  links => @index-title,
  e => qq:to/HTML/,
  <h1>Welcome!</h1><p>This by <i>NO</i> means covers all of the intricacies of Perl 6; if you would like to see more or have no prior programming experience, please visit the <a href=\"https://perl6.org/resources//\">official page for other resources</a>. If you haven't already, install Rakudo Perl 6 <a href="https://rakudo.org/files">here</a>, and if you need any help, feel free to join us at <a href="irc://irc.freenode.net/#perl6">#perl6.</a></p>
  HTML
}
spurt 'docs/index.html', $out;

spurt 'docs/style.css', $css;

spurt 'docs/CNAME', 'perl6byexample.com';
