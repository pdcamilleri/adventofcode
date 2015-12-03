#!/usr/bin/perl
# It might not be pretty, but I'm not enjoying re-learning Perl and all it's oddities.

# I'm not doing anything fancy here, just dividing up the list of directions into bigrams
# and keeping track of Santa and Robo-santa separately.
# Both Santa and Robo-santa check if the other has already delivered presents to a house
# before adding a new entry into their own hashes.

open my $input, '<', 'input';
chomp(my @directions = <$input>);
close $input;

my $sx = 0;
my $sy = 0;
my %santa;

my $rx = 0;
my $ry = 0;
my %robot;

# The =~ operator becomes magic in list context apparently. http://stackoverflow.com/a/372397/5357756
# Here we now have pairs of directions, e.g. [ 'V>', '<^', ...]
@direction_pairs = ( $directions[0] =~ m/../g );

for $step (@direction_pairs) {
   # Record this house as receiving a present,
   # but not if robot-santa has already been there.
   if (not $robot{$sx}{$sy}) {
      $santa{$sx}{$sy}++;   
   }
 
   # Don't record house if santa has already been there
   if (not $santa{$rx}{$ry}) {
      $robot{$rx}{$ry}++;
   }

   # Break up the combined step into its components.
   ($santa_step, $robot_step) = split //, $step;

   # Move to next house.
   $sx++ if $santa_step eq '>';
   $sx-- if $santa_step eq '<';
   $sy++ if $santa_step eq '^';
   $sy-- if $santa_step eq 'v';

   # Move to next house.
   $rx++ if $robot_step eq '>';
   $rx-- if $robot_step eq '<';
   $ry++ if $robot_step eq '^';
   $ry-- if $robot_step eq 'v';
   
}

# Loop through the two levels of arrays
my $total = 0;
for (keys %santa) {
   $total += scalar keys $santa{$_};
}

for (keys %robot) {
   $total += scalar keys $robot{$_};
}

print "$total\n";
