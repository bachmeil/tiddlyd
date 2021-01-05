# Overview

[TiddlyWiki](https://tiddlywiki.com/) is a single-file web app that can be used as a wiki, journal, and numerous other things. The magic of TiddlyWiki in its early days happened when you used it on Firefox. You'd load a single html file in your browser and then save your updates inside the file itself. At some point, for security reasons, Mozilla removed that functionality. The present state of the TiddlyWiki getting started page is a smorgasbord of options, all of which require at least a modest level of technical knowledge, and none of which have a save process that results in an updated html file and nothing more.

That's where this project comes in. I set out to create an option in D that:

- has a dead simple compilation process,
- is dead simple to use, and
- updates the existing html file and does nothing else - no backups, no directories of files, just an updated version of the html file you're working on.

# Download and Compile

**Step 1** Either download the two D files (`tiddly.d` and `cgi.d`) or clone this repo. Download an empty tiddler into the same directory. You can always get the latest version of the empty tiddler by clicking the "Download Empty" button on [the TiddlyWiki website](https://tiddlywiki.com/).

**Step 2** (Optional) Install the latest DMD compiler [from here](https://dlang.org/download.html) if you don't already have a D compiler.

**Step 3** Compile and run:

```
dmd tiddly.d newcgi.d -version=embedded_httpd
./tiddly
```

Navigate your browser to localhost:8085/empty and start using TiddlyWiki. The updated `empty.html` file will be saved on every edit of the tiddler. (You con confirm that it's working by reloading the file after the first change just to be safe.)

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