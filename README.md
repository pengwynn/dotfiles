## There's no place like ~/

These are my personal [dotfiles][]. They turn ordinary stock applications into
my own carefully crafted lightsaber.

    {///////\\\\\\\<#>}=============================================

[Yonk][] and I scour the galaxy looking for nanosecond timesavers for all our
favorite tools. If you've got a tip [let us know][octodots].

![screencap][]

## Get your own ##

If you're new to dotfiles, this probably isn't the best starter repository for
you. While these started as a clone of [Holman's][holman/dotfiles], many
utilities are unique to my workflow. I recommend other [dotfile frameworks][dotfiles]
out there.

### Installation ###

If you're crazy and want to clone my dots anyway:

- `git clone https://github.com/pengwynn/dotfiles.git ~/.dotfiles`
- `cd ~/.dotfiles`
- `script/bootstrap`

The install script will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though. All files and folders ending in `.symlink` get, you guessed it,
symlinked. For example: `~/.dotfiles/vim/vimrc.symlink` gets symlinked to
`~/.vimrc`.

## Main elements ##

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
- **topic/\*.completion.sh**: Any files ending in `completion.sh` get loaded
  last so that they get loaded after we set up zsh autocomplete functions.

## Prior art ##

This project began as a fork of (and is heavily inspired by)
[Zach Holman's dotfiles][holman/dotfiles], whose topic-based symlinking
approach makes this so easy. I also have stolen freely from:

* [Mathias Bynens](http://github.com/mathiasbynens/dotfiles)
* [Yan Pritzker](http://github.com/skwp/dotfiles)
* [Josh Clayton](http://github.com/joshuaclayton/dotfiles)
* [Adam Jahnke](http://github.com/adamyonk/dotfiles)
* [Tom Ryder](http://github.com/tejr/dotfiles)
* [Steve Losh](http://github.com/sjl/dotfiles)

## Share your dots

If you've got a great set of dots (or want to get started), check out
[dotfiles.github.com][dotfiles]. Ping @[octodots][] with great dot sets you've
found or tips and tricks for your favorite tools.

[dotfiles]: http://dotfiles.github.com
[Yonk]: https://twitter.com/adamyonk
[octodots]: https://twitter.com/octodots
[holman/dotfiles]: https://github.com/holman/dotfiles
[screencap]:
http://cl.ly/image/3k171S3E3k2q/Screen%20Shot%202013-02-07%20at%2011.06.41%20AM.png
