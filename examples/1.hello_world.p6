## Comments
#----------

# Comments start with a # and ignored by the Perl 6 compiler.
# By the way, this is a single-line comment.

#`{ You can use matching bracketing characters such as [], (), {}, etc. for multi-line comments }

## Printing to the standard output:

# say - prints its arguments to the standard output, followed by a newline.
#       It calls the .gist method on its arguments.

say "Hello World";  # function invocation

say("Hello World");

"Hello World".say;  # method invocation

# print - prints its arguments to the standard output, without appending
#         a newline.

print "Hello World\n";

# put - works like say but doesn't call the .gist method on its arguments.

put "Hello World";

