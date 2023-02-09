package WordProcessing;
use feature 'say';
use strict;
use warnings;


my @worlde_array;

sub new {
    my $class = shift;
    my $self = {};
    bless $self, $class;
    return $self;
}

sub getRandomWord {
    my $wordle_file = 'lib/words_list.txt';
    # open file
    open my $fh, '<', $wordle_file 
    # or kill the program if the file can't be opened
    or die "Can't open file : $_";

    # load the words into an array
    while(my $i = <$fh>){
        chomp($i);
        push(@worlde_array, $i);
    }
 
    # Close the file
    close $fh or die "Couldn't Close File : $!";

    # return a random word
    my $random_word = $worlde_array[rand @worlde_array];

    return $random_word;
}

sub inputProcessing {
    my ($self, $input) = @_;
    $input = uc $input;
    return $input;
}

sub isInTheWordArray {
    my ($self, $input) = @_;
    if (grep {$_ eq $input} @worlde_array) {
        return 1;
    }
    else {
        return 0;
    }
}

# ---------------------------- Printing solutions ---------------------------- #
sub printBoldGreen {
    my ($self, $input) = @_;
    print "\033[1;32m$input\033[0m  ";
}

sub printBoldRed {
    my ($self, $input) = @_;
    print "\033[1;31m$input\033[0m  ";
}

sub printBoldYellow {
    my ($self, $input) = @_;
    print "\033[1;33m$input\033[0m  ";
}

sub printBold {
    my ($self, $input) = @_;
    print "\033[1m$input\033[0m  ";
}

sub clearScreen {
    my ($self) = @_;
    my $clear_string = `clear`;
    print $clear_string;
}
1;

