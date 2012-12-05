use strict;
use warnings;

package BaconBot;
use Bot::BasicBot;
@BaconBot::ISA = ('Bot::BasicBot');

sub qsay {
	my $self = shift;
	my $channel = shift;
	my $content = shift;
	
	$self->say(
		channel => $channel,
		body => $content);
}

sub said {
	my $self = shift;
	my $dict = shift;
	
	my $rant = "Channel highlights look exactly the same as unread PM windows. Both go to a phone. Both get attention equally well. If you ask in public to read a private message, you are an attention whore.";
	
	if ($dict->{body} =~ m/(check|read|look|see).*PM/i) {
		my $chan = $dict->{channel};
		my $dude = uc $dict->{who};
		
		$self->qsay($chan, "\x02$rant\x02");
		$self->qsay($chan, "LOOK! $dude! I SENT YOU A MESSAGE!");
		$self->qsay($chan, "LOOK! I SENT ANOTHER! $dude!");
		$self->qsay($chan, "$dude! $dude!");
		
		$self->qsay($chan, "[BaconBot] Credits to the rant go to DHowett, and creation to theiostream.");
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