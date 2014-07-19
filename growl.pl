use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '0.0.3';
%IRSSI = (
	authors     => 'Joe Love',
	contact     => 'gnotify@joelove.uk',
	name        => 'gnotify',
	description => 'Send a Growl notification that shows who is talking to you in which channel.',
	license     => 'GNU General Public License'
);

#--------------------------------------------------------------------
# Based on fnotify.pl 0.0.3 by Thorsten Leemhuis
# https://gist.github.com/matthutchinson/542141
# which is in parts based on knotify.pl 0.1.1 by Hugo Haas
# http://larve.net/people/hugo/2005/01/knotify.pl
# and notify.pl from Luke Macken
# http://fedora.feedjack.org/user/918/
# which is in turn based on osd.pl 0.3.3 by Jeroen Coekaerts, Koenraad Heijlen
# http://www.irssi.org/scripts/scripts/osd.pl
#--------------------------------------------------------------------

sub priv_msg {
	my ($server,$msg,$nick,$address,$target) = @_;
	growl($nick." " .$msg );
}

sub hilight {
    my ($dest, $text, $stripped) = @_;
    if ($dest->{level} & MSGLEVEL_HILIGHT) {
		growl($dest->{target}. " " .$stripped );
    }
}

sub growl {
	my ($message) = @_;
	my ($growl_cmd) = "growlnotify -m '". $message ."'";
	system($growl_cmd);
}

Irssi::signal_add_last("message private", "priv_msg");
Irssi::signal_add_last("print text", "hilight");
