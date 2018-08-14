use Cro::HTTP::Router;
use Cro::HTTP::Server;
use Cro::WebApp::Template;

if !'html'.IO.d || 'html'.IO.dir.elems == 0 {
  die 'Run colorize.p6 first!';
}

my $css = slurp 'css/code.css';
$css ~= slurp 'css/style.css';

my @pages;
my @titles;

('html'.IO.dir).map: {
  @pages.push: slurp $_ if !$_.d;
  @titles.push: ($_.basename).Str.subst('.html', '');
}

my $routes = route {
  get -> 'e', Int $page {
    if $page <= @pages.elems && $page > 0 {
      template 'templates/main.crotmp', { e => @pages[$page-1], links => %(1..Inf Z=> @titles).sort };
    }
  }
  get -> {
    template 'templates/main.crotmp', {
      e => "<h1>Welcome!</h1> This by <i>NO</i> means covers all of the intricacies of Perl 6; if you would like to see more or have no prior programming experience, please visit the <a href=\"https://docs.perl6.org/\">official documentation</a>.",
      links => %(1..Inf Z=> @titles).sort
    };
  }
  get -> 'style.css' {
    content 'text/css', $css;
  }
}

my Cro::Service $service = Cro::HTTP::Server.new(
  http => <1.1>,
  application => $routes,
  port => 3333
);

$service.start;

react {
  whenever signal(SIGINT) {
    $service.stop;
    done;
  }
}
