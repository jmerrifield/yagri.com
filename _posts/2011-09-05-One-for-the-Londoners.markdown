I [noticed while eating breakfast][bbc_article] this morning that TfL have *finally* made their live bus departure information [available through their website][tfl_businfo]. I've been a long-time complainer about how useless the displays are at bus stops, because once I'm physically at the stop, it makes no difference when the bus will arrive - I have to wait regardless! When I really need the information is when I'm leaving the house in the morning.

The site hasn't officially been launched yet, so who knows what changes they'll make, but I like the current implementation for it's simplicity - I just set up my favourite stops, and get a simple view showing the next handful of buses due at each stop.

I noticed there's no mobile specific version, and the standard site uses flash, although the ['text version'][tfl_text] is much better for mobile browsing.  The other problem for mobile users is that your saved stops aren't attached to a user account, just a cookie from what I can tell, so you can't set up all your stops on the desktop, then see them on your phone, because it's a new session. Adding stops on a phone is a seriously unpleasant experience...

I thought I'd make it a bit more useful for myself, so whilst trying not to get scrambled eggs on my keyboard, I threw together a simple scrape-and-re-format app using [Nokogiri][noko], [Sinatra][sinatra], and [jQuery Mobile][jqmob].  It makes a request to the 'accessible' version of the TfL site, parses out the useful information, and renders it in a mobile-friendly format. It makes the request using a cookie containing the 'UserToken', so once I've set up all my stops on a real browser, using the flash site, I can crack open the cookie inspector and find out my own UserToken, then pass that through to Sinatra and all my stops are there already.

![screenshot 1][screen1]
![screenshot 2][screen2]

The code itself is ridiculously simple - currently around [16 lines for the HTML scraping portion][app_rb], and a huge [23 line HAML view][view_haml].  This sort of thing reminds me why I love Ruby!

If you feel like using it, firstly go to the real [TfL countdown site][tfl_businfo], find all your favourite stops, and add them to 'My Stops' (at the time of writing the normal version is having issues, if so try the [text version][tfl_text]).  Then inspect the page cookies with your tool of choice (in Chrome, hit Ctrl+Shift+I to bring up the developer tools window, open the 'Resources' tab and expand the 'Cookies' node).  Grab the value of the 'UserToken' setting (it will be in GUID form).

Now browse to <http://london-live-buses.herokuapp.com>, paste your token into the text box, hit the button, and you should be looking at a mobile-friendly version of your bus times.  Bookmark the URL or send it to your phone for easy lookups on the go!  If you prefer, just [grab the source][github] and create your own Heroku deployment.

I am aware that the UI needs some tidying up!  It will come in time...

[bbc_article]: http://www.bbc.co.uk/news/uk-england-london-14779558
[tfl_businfo]: http://countdown.tfl.gov.uk/#/
[tfl_text]: http://accessible.countdown.tfl.gov.uk/
[noko]: http://nokogiri.org/
[sinatra]: http://www.sinatrarb.com/
[jqmob]: http://jquerymobile.com/
[app_rb]: https://github.com/jmerrifield/london_buses/blob/master/app.rb
[view_haml]: https://github.com/jmerrifield/london_buses/blob/master/views/buses.haml
[github]: https://github.com/jmerrifield/london_buses
[screen1]: /images/2011-09-05-One-for-the-Londoners-pic1.jpg
[screen2]: /images/2011-09-05-One-for-the-Londoners-pic2.jpg
