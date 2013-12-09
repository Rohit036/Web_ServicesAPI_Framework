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


#while($serverdata = <$socket>)
#{
#print "$serverdata";
#}

# Send some message to server.
#$clientdata = "This is the Client speaking :)";

#while(1)
#{
$clientdata = <STDIN>;
chomp($clientdata);
my $i = 0;
while($i < 2)
{
if($serverdata = <$socket>)
{
print $serverdata;
#print "1.Type filename with parameters to execute \n";
#print "2.Type quit to exit \n";
}
#$clientdata = <STDIN>;
#chomp($clientdata);
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
#}
