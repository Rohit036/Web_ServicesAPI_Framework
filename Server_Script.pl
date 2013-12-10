#!/usr/bin/perl
use lib 'C:\Users\anmol\Desktop\Perl\Server'; # Change the Directory where the My/Math.pm is located. Add the math.pm inside folder named My.
use strict;
use warnings;

use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib dirname(dirname abs_path $0) . '/lib';

use strict;
use warnings;
use IO::Socket::INET;

my $socket;
my $clientsocket;
my $serverdata;
my $clientdata;
my $ans;
my @myarray;
my @data;
my $mystring;
our %filemethods = ();


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
                if($methodname eq "add"){

                        use My::Math qw(add);
                        $ans = add($input, $input1);
                        print $clientsocket "$ans \n";
                }
                
                if($methodname eq "subtract"){
                        
                        use My::Math qw(subtract);
						$ans = subtract($input, $input1);
                        print $clientsocket "$ans \n";
                }

                
        }
}
