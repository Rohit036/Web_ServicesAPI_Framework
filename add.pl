sub add{
my $num  = $_[0];
my $num1 = $_[1];
if($input_method == add){
return $num + $num1;
}}

sub subtract{
my $num  = $_[0];
my $num1 = $_[1];
if($input_method == add){
return $num - $num1;
}}

sub multiply{
my $num  = $_[0];
my $num1 = $_[1];
if($input_method == add){
return $num * $num1;
}}

sub divide{
my $num  = $_[0];
my $num1 = $_[1];
if($input_method == add){
return $num / $num1;
}
}
1;
