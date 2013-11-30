#!/usr/bin/perl

use strict;
use warnings;
use IO::Socket::INET;

my $socket;
my  $clientsocket;
my $serverdata;
my $clientdata;

$socket = new IO::Socket::INET (
    LocalHost => '127.0.0.1',
    LocalPort => '0155',
    Proto => 'tcp',
    Listen => 1,
    Reuse => 1
) or die "Oops: $! \n";
print "Waiting for the Client.\n";


$clientsocket = $socket->accept();

print   "Connected from : ", $clientsocket->peerhost();     # Display messages
print   ", Port : ", $clientsocket->peerport(), "\n";

# Write some data to the client  
$serverdata = "This is the Server speaking :)\n";
print $clientsocket "$serverdata \n";

# read the data from the client
$clientdata = <$clientsocket>;
print "Message received from Client : $clientdata\n";

$socket->close();  
