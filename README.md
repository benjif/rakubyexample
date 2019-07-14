# Perl 6 By Example

See it in action [here](https://benjif.github.io/p6byexample/).

## Why?

Several other languages that I've encountered offer a variation of the "\* by example" scheme. They offer short-and-sweet examples to get users started. This is something that I find that the [official examples page](http://examples.perl6.org/) doesn't accomplish well.

## Contributing

To contribute, fork this repository and add any examples to the `examples` folder. Then, generate the HTML and CSS.

If you'd like to contribute without making a pull request, feel free to add an issue.

### Dependencies

- Text::VimColour
- Cro::WebApp

### Generating HTML/CSS

Colorize the example files (examples/\*) with `perl6 colorize.p6`, and then generate the HTML/CSS/image changes with `perl6 generate.p6`.
