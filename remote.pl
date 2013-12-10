require "client.pl";

$x = remote_proc("add", "2", "3");
print $x;
