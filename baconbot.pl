use strict;
use warnings;

package BaconBot;
use Bot::BasicBot;
@BaconBot::ISA = ('Bot::BasicBot');

sub said {
	my $self = shift;
	my $dict = shift;
	
	my $rant = "Channel highlights look exactly the same as unread PM windows. Both go to a phone. Both get attention equally well. If you ask in public to read a private message, you are an attention whore.";
	
	if ($dict->{body} =~ m/(check|read|look|see).*PM/i) {
		$self->say(
			channel => $dict->{channel},
			body => "\x02$rant\x02");
	}
}

1;

package main;

my $bot = BaconBot->new(
	server => "irc.saurik.com",
	port => "6667",
	channels => ["#teambacon","#theos","#bacon"],
	
	nick => "baconbot",
	username => "BaconBot",
	name => "Bacon Coding Company, LLC. bot");
$bot->run();