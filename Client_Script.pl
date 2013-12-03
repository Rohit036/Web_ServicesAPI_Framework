#!/usr/bin/perl

use strict;
use warnings;
use IO::Socket::INET;

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
print "Message from Server : $serverdata";
$serverdata = <$socket>;
print "$serverdata";


while($serverdata = <$socket>)
{
print "$serverdata";
#}

# Send some message to server.
#$clientdata = "This is the Client speaking :)";

#while(1)
#{
#if($serverdata = <$socket>)
#{
#print $serverdata."\n";
#}
$clientdata = <STDIN>;
chomp($clientdata);
if($clientdata eq "quit")
{
$socket->close();
last;
}
else
{
print $socket "$clientdata\n";
}
}
