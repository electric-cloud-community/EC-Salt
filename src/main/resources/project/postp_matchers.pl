@::gMatchers = (
  #module is not available
  {
    id =>        "moduleError",
    pattern =>          q{\"(.*)\" is not available.},
    action =>           q{&addSimpleError("moduleError", "$1 is not available");setProperty("outcome", "error" );updateSummary();},
  },
  #TypeError 
  {
    id =>        "TypeError",
    pattern =>          q{TypeError:\s(.*)},
    action =>           q{&addSimpleError("TypeError", "$1");setProperty("outcome", "error" );updateSummary();},
  },
  #salt-key generic error:
  {
    id =>        "keyError",
    pattern =>          q{salt-key:\serror:\s(.*)},
    action =>           q{&addSimpleError("keyError", "$1");setProperty("outcome", "error" );updateSummary();},
  },
);

sub addSimpleError {
    my ($name, $customError) = @_;
    if(!defined $::gProperties{$name}){
        setProperty ($name, $customError);
    }
}

sub updateSummary() {
 
    my $summary = (defined $::gProperties{"moduleError"}) ? $::gProperties{"moduleError"} . "\n" : "";
    $summary .= (defined $::gProperties{"TypeError"}) ? $::gProperties{"TypeError"} . "\n" : "";
    $summary .= (defined $::gProperties{"keyError"}) ? $::gProperties{"keyError"} . "\n" : "";

    setProperty ("summary", $summary);
}