#!/usr/bin/perl
require "add.pl";
use strict;
use warnings;
use IO::Socket::INET;

my $socket;
my $clientsocket;
my $serverdata;
my $clientdata;
my @myarray;
my @data;
my $mystring;
our %filemethods = ();

%filemethods = (
"add.pl" => ["add","subtract","multiply","divide"]
);

    

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
#$serverdata = "1.add 2.subtract 3.multiply 4.divide \n";
#print $clientsocket "$serverdata \n";

#$serverdata = <STDIN>;
#print $clientsocket "$serverdata";

# read the data from the client
while($clientdata = <$clientsocket>)
{
if(($clientdata eq "quit") or ($clientdata eq ""))
{
$socket->close();
}
else
{
print "Message received from Client : $clientdata\n";
@data = split(" ", $clientdata);

my $methodname = shift @data;
my $input = shift @data;
my $input1 = shift @data;


#@myarray = `$filename $input`;
$mystring = &{\&{$methodname}}($input, $input1);
print $clientsocket "$mystring \n";
#print $clientsocket "1.add 2.subtract 3.multiply 4.divide \n";
}
}
