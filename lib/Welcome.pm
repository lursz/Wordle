package Welcome;
use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = {};
    bless $self, $class;
    return $self;
}

sub welcome_ASCII {
my $mess = <<END;
██╗    ██╗ ██████╗ ██████╗ ██████╗ ██╗     ███████╗
██║    ██║██╔═══██╗██╔══██╗██╔══██╗██║     ██╔════╝
██║ █╗ ██║██║   ██║██████╔╝██║  ██║██║     █████╗  
██║███╗██║██║   ██║██╔══██╗██║  ██║██║     ██╔══╝  
╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝███████╗███████╗
 ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝  
Type '/rules' for rules.\nType in your word:                                     
END
return $mess;
}


sub rules {
my $rules = <<END;
Guess the word in 6 tries.
Each guess must be a valid 5-letter word.
The colour of the tiles will indicate how close you are to the word:
    - Red: The letter is not in the word.
    - Yellow: The letter is in the word, but not in the correct position.
    - Green: The letter is in the word and in the correct position.
Good luck!

Type in your word:
END
return $rules;
}
1;
