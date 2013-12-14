require "client.pl";

$x = remote_proc("add", "2", "3");
$y = remote_proc("subtract", "3", "2");
print $x;
print $y;
