Every time I interview for a programming job the same dreaded question comes up\: "If you had to join a number of strings together, how would you do it?".  Every time I hear it, I die a little on the inside, while I sit there wondering if I should launch into a rant about [the evils of micro-optimisation][1], or start comparing the [relative performance][2] of various string concatenation methods.  I usually tell them what they're obviously waiting to hear: "I would use a StringBuilder because it is far more memory efficient than multiple string concatenations".  Straight from the textbook.

Regardless of which method you use, you can't escape the fact that most string concatenation code is ugly as hell, let's look at a few ways you could create a comma separated list of customers names, each one surrounded with quotes:

<script src="https://gist.github.com/1093711.js?file=Setup.cs"></script>

<script src="https://gist.github.com/1093711.js?file=StandardConcatenation.cs"></script>

<script src="https://gist.github.com/1093711.js?file=StringBuilderConcatenation.cs"></script>

<script src="https://gist.github.com/1093711.js?file=StringJoinConcatenation.cs"></script>

It's surprising how this fairly simple task turns into such a lot of code, none of it particularly intention-revealing.  The most unfriendly one appears to be the StringBuilder implementation.  As a side note, I expect most people wouldn't bother defining constants for 'quote' and 'separator', since they're unlikely to change, and only one character long anyway, but in this case having an obvious and explicit name for each one makes it clearer at a first glance to see the intention behind the code (see [ScreechinglyObviousCode][3]).

With a few very simple extension methods, which look like they would come in handy all over, we can reduce this task to the amount of code that it seems like it should take - a screamingly obvious one-liner.

<script src="https://gist.github.com/1093711.js?file=StringExtensions.cs"></script>

Now we can use this:

<script src="https://gist.github.com/1093711.js?file=ReadableConcatenation.cs"></script>

It's always worth adding a few simple utility methods to help make your core business logic code more readable and intention-revealing.  With extension methods our utility functions can be easily discoverable and obviously named (no more big-bag-o-crap static utility classes with hundreds of badly-named, unrelated functions!)

[1]: http://www.codinghorror.com/blog/2009/01/the-sad-tragedy-of-micro-optimization-theater.html
[2]: http://www.codeproject.com/KB/cs/StringBuilder_vs_String.aspx
[3]: http://c2.com/cgi/wiki?ScreechinglyObviousCode