package My::Math;
use strict;
use warnings;
 
my $x;
my $y;
use Exporter qw(import);
 
our @EXPORT_OK = qw(add multiply subtract divide);
 
sub add {
  my ($x, $y) = @_;
  return $x + $y;
}
 
sub multiply {
  my ($x, $y) = @_;
  return $x * $y;
}

sub subtract {
	my($x,$y) = @_;
	return $x - $y;
}

sub divide {
	my($x, $y) = @_;
	return $x/$y;
}
1;
