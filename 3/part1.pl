#!/usr/bin/perl
# I haven't "perl"ed in about 5 years, so it's a little rusty.

open my $input, '<', 'input';
chomp(my @directions = <$input>);
close $input;

my $x = 0;
my $y = 0;
my %houses;

for $step (split "", $directions[0]) {
   # Record this house as receiving a present.
   $houses{$x}{$y}++;   
   
   # Move to next house.
   $x++ if $step eq '>';
   $x-- if $step eq '<';
   $y++ if $step eq '^';
   $y-- if $step eq 'v';
   
}

# Loop through the two levels of arrays
my $total = 0;
for (keys %houses) {
   $total += scalar keys $houses{$_};
}

print "$total\n";

# Another way to do it would be to store ($x, $y) tuples in an array, and then do some sort of length (sort + uniq)
