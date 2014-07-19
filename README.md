#Irssi scripts
######A set of Perl scripts created for the command line IRC client Irssi (http://irssi.org)

###Usage:
After cloning the repository, copy the desired scripts to `~/.irssi/scripts/`. Load them by using `/script load <filename>` from inside Irrsi.

To autoload scripts when Irssi starts, create a symbolic link to each script in `~/.irssi/scripts/autorun/` using `ln -s <source_file> <target_file>`.

##growl.pl
A script that sends Growl notifications when a _hilight_ is triggered. For more information see http://www.irssi.org/documentation/manual.

Requires GrowlNotify (http://growl.info/downloads) to function (for ease, soon to be updated).

##nick_color.pl
A script that allows custom coloration of other users' names.