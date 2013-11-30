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
print "Message from Server : $serverdata \n";

# Send some message to server.
#$clientdata = "This is the Client speaking :)";
print "Type name of file to execute\n";
while($clientdata = <STDIN>)
{
chomp($clientdata);
if($clientdata eq "quit")
{
$socket->close();
last;
}
else
{
print "\n1.Type name of file to execute\n";
print "2.Type quit to exit\n\n";
print $socket "$clientdata\n";
}
}
#print $socket "$clientdata \n";

#$socket->close();
