#!/usr/bin/perl -w
#ShortenName.pl
# shorten the sequence names to accession numbers from fasta file.

while (<>){
    chomp;
    unless (/^>/) {  # Not the name line
       print "$_\n";
       next;
    }

    # We are dealing with the name when the process reaches here.
    s/^>\s*//;      # get rid of '>'

    my @line = split /\s+/;

    my $first = shift (@line);  # gi|49188826|gb|CO267808.1|CO267808
    my @numbers = split /\_/, $first;

    $accNum = $numbers[1];

    print ">$accNum\n";
}

exit;
