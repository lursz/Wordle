# !/usr/bin/perl
use strict;
use warnings;
use diagnostics;
use feature 'say';
use feature "switch";
use v5.34.0;

use lib 'lib';
use Welcome;
use WordProcessing;

# ---------------------------------- Welcome --------------------------------- #
my $welcome_ = new Welcome();
say $welcome_->welcome_ASCII();

# ------------------------------ Data containers ----------------------------- #
my $word_processing_ = new WordProcessing();
my $answer = $word_processing_->getRandomWord();

# user input
my $input; 

# array containging answers to particular rounds
my @result = (0) x 5;

# mapping letters to array indexes using ACVII code -65
# 0:A, 1:B, 2:C ... 25:Z
my @bool_alphabet;


# -------------------------------- Game logic -------------------------------- #
for (my $i = 0; $i < 6; $i++) {

    # incrementing the bool_alphabet's values when the letter is found in the answer
    @bool_alphabet = (0) x 26; 
    for (my $i = 0; $i < length($answer); $i++){
        $bool_alphabet[ord(substr($answer, $i, 1)) - 65]++;
    }


    # make certain that the user enters a valid word
    while(1)
    {
        $input = <STDIN>;
        chomp $input;
        if ($input eq '/rules') {
            say $welcome_->rules();
            $input = <STDIN>;
            chomp $input;
        }

        $input = $word_processing_->inputProcessing($input);

        if (length($input) == 5 && $word_processing_->isInTheWordArray($input) == 1) {
            last;
        }
        if (length($input) != 5) {
            say "Word must be 5 letters long.\nEnter a new word:";
        }
        elsif ($word_processing_->isInTheWordArray($input) == 0) {
            say "Such word doesn't exist.\nEnter a new word:";
        }
        else {
            say "Something went wrong. Try again:";
        }
    }


    # Calculate the result array 
    # (0 - not in the word, 1 - in the word, 2 - in the word and in the right place)
    for (my $j = 0; $j < 5; $j++) {
        if (substr($answer, $j, 1) eq substr($input, $j, 1)) {
            $result[$j] = 2;
            $bool_alphabet[ord(substr($answer, $j, 1)) - 65]--;
        }
        elsif ($bool_alphabet[ord(substr($input, $j, 1)) - 65] > 0) {
            $result[$j] = 1;
            $bool_alphabet[ord(substr($input, $j, 1)) - 65]--;
        }
        else {
            $result[$j] = 0;
        }
   }

    # Print the result array
    say " --- ", $i + 1, " --- ";
    for (my $j = 0; $j < 5; $j++) {
        if ($result[$j] == 2) {
            $word_processing_->printBoldGreen(substr($input, $j, 1));
        }
        elsif ($result[$j] == 1) {
            $word_processing_->printBoldYellow(substr($input, $j, 1));
            
        }
        else {
            $word_processing_->printBold(substr($input, $j, 1));
        }
    }
    say "";

    # Check if the user won
    if ($input eq $answer) {
        say "\nCorrect answer. You win!";
        exit;
    }

}
say "You lose. The answer was: $answer. Good luck next time!";

