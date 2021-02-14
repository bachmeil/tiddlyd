# Overview

[TiddlyWiki](https://tiddlywiki.com/) is a single-file web app that can be used as a wiki, journal, and numerous other things. The magic of TiddlyWiki in its early days was when you'd load it as a single html file in Firefox and it would save your updates automatically while you work. At some point, for security reasons, Firefox removed the ability to automagically save updates. The present state of the TiddlyWiki getting started page is a smorgasbord of options, all of which require at least a modest level of technical knowledge, and none of which have a save process that results in an updated html file and nothing more.

That's where this project comes in. I set out to create an option in D that:

- has a dead simple compilation process,
- is dead simple to use, and
- updates the existing html file and does nothing else - no backups, no directories of files, just an updated version of the html file you're working on.

There's nothing learn in order to use tiddlyd. You enter a single short compilation command to create the executable. When you want to use your wiki, you run the executable and open the html file in your browser. Some things I hate: dependencies, configuration files, upgrades, breaking changes, surprises that eat up 8 GB of RAM, spending half the morning repairing something to get my system working again. tiddlyd lets me avoid all of them.
 
# Download and Compile

**Step 1** Either download the two D files (`tiddly.d` and `cgi.d`) or clone this repo. Download an empty tiddler into the same directory. You can always get the latest version of the empty tiddler by clicking the "Download Empty" button on [the TiddlyWiki website](https://tiddlywiki.com/).

**Step 2** (If needed) Install the latest DMD compiler [from here](https://dlang.org/download.html) if you don't already have a D compiler.

**Step 3** Compile and run. The second line should work on Linux or Mac. If you're using Windows, use whatever method you use on Windows to run an executable.

```
dmd tiddly.d cgi.d -version=embedded_httpd
./tiddly
```

Navigate your browser to localhost:8085 and start using TiddlyWiki. The updated `empty.html` file will be saved on every edit of the tiddler. (You can confirm that it's working by reloading the file after the first change just to be safe.)

# Different filename or URL

The default filename is empty.html. You can call your wiki's filename anything you want as long as it has an html extension. You then call it with the URL localhost:8085/[filename], where [filename] is the name of the file with or without the html extension. For instance, if your wiki file is named mywiki.html, you can go to the URL localhost:8085/mywiki or localhost:8085/mywiki.html.

# Questions

Click the "Discussions" tab if you have any questions.

# cgi.d

For convenience, I've included a copy of Adam Ruppe's `cgi.d` file, [taken from his helpful repo](https://github.com/adamdruppe/arsd). As this repo might not always have the latest version of `cgi.d`, you may want to grab the latest version from the source.

# Other Compilers

LDC and GDC have been tested and are known to work. You can change the compilation command accordingly:

```
ldmd2 tiddly.d newcgi.d -version=embedded_httpd
gdc tiddly.d newcgi.d -fversion=embedded_httpd
```
