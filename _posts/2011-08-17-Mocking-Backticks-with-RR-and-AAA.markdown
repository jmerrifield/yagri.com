In my adventures through RubyLand, I've been using the excellent [RR][1] test double framework together with [RSpec][2], for some really expressive tests.  The other day I was writing a test to prove that a class had invoked a shell command with the correct command-line.  I knew there would be some way of mocking the backtick operator in Ruby, but for once RR was working against me.  I found [this post on the astrails blog][3] to be the key.

It wasn't quite enough for me though.  I like to test in an AAA style, and what I wanted was the following:

{% gist 1151070 what_i_wanted.rb %}

Using the information I already knew, I could set up a mock which would automatically fail if the command wasn't invoked, but I didn't want that embedded in the 'before' block.  If I changed it to a stub, which would accept any command, how could I verify it later on?

Digging into the code of RR revealed that calling 'my_object.should have_received.my_method()' simply uses method_missing on the [InvocationMatcher class][4].  I could invoke that directly and make an assertion on the command that should have been run:

{% gist 1151070 how_i_did_it.rb %}

[1]: https://github.com/btakita/rr
[2]: http://relishapp.com/rspec
[3]: http://blog.astrails.com/2010/7/5/how-to-mock-backticks-operator-in-your-test-specs-using-rr
[4]: https://github.com/btakita/rr/blob/master/lib/rr/adapters/rspec.rb