#!/usr/bin/perl
sub remote_proc
{
	use strict;
	use warnings;
	use IO::Socket::INET;

	my $method = $_[0];
	my $input = $_[1];
	my $input1 = $_[2];
	my $ans;
	my $socket;
	my $serverdata;
	my $clientdata;

	$socket = new IO::Socket::INET (
		PeerHost => '127.0.0.1',
		PeerPort => '0155',
		Proto => 'tcp',
		) or die "$!\n";

	print "Connected to the Server.\n";

# read the message sent by server.
$serverdata = <$socket>;
#print "Message from Server : $serverdata";

$clientdata = $method." ".$input." ".$input1;
my $i = 0;
while($i < 2)
{
	if(defined($serverdata = <$socket>)) # To handle the error saying something abrupt with HANDLE something something.
	{
		$ans = $serverdata;
	}
	if($clientdata eq "quit")
	{
		$socket->close();
		last;
	}
	else
	{
		print $socket "$clientdata\n";
	}
	$i++;
}
return $ans;
}
1;
