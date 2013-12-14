#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket::INET;

my $socket;
my $serverdata;

$socket = new IO::Socket::INET (
  #PeerHost => '172.19.6.195',
  PeerHost => '127.0.0.1',
  PeerPort => '0155',
  Proto => 'tcp',
) or die "$!\n";

# read the message sent by server.
$serverdata = <$socket>;
print "Message from Server : $serverdata";

print "Connected to the Server.\n";

sub remote_proc
{
my $method = $_[0];
my $input = $_[1];
my $input1 = $_[2];
my $ans;
my $clientdata;

$clientdata = $method." ".$input." ".$input1;
my $i = 0;
while($i < 2)
{
if(defined($serverdata = <$socket>))
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
