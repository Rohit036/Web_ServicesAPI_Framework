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

$clientdata = <STDIN>;
chomp($clientdata);
my $i = 0;
while($i < 2)
{
if($serverdata = <$socket>)
{
print $serverdata;

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
