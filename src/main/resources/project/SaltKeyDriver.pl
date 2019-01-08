# -------------------------------------------------------------------------
# Package
#    SaltKeyDriver.pl
#
# Dependencies
#    None
#
# Purpose
#    Creates a command line to manage public keys used for authentication.  
#
# Plugin Version
#    1.0.0
#
# Date
#    04/09/2012
#
# Engineer
#    Carlos Rojas
#
# Copyright (c) 2012 Electric Cloud, Inc.
# All rights reserved
# -------------------------------------------------------------------------


# -------------------------------------------------------------------------
# Includes
# -------------------------------------------------------------------------
use strict;
use warnings;
use ElectricCommander;
$|=1;

sub main{
    my $ec = ElectricCommander->new();
    $ec->abortOnError(0);
    
    # -------------------------------------------------------------------------
    # Parameters
    # -------------------------------------------------------------------------
    my $Path2Saltkey    = ($ec->getProperty( "Path2Saltkey" ))->findvalue('//value')->string_value;
    my $Action          = ($ec->getProperty( "Action" ))->findvalue('//value')->string_value;
    my $Name            = ($ec->getProperty( "Name" ))->findvalue('//value')->string_value;
    
    my @args = ();
    
    if($Path2Saltkey && $Path2Saltkey ne ""){
        push(@args,qq{"$Path2Saltkey"});
    }else{
        push(@args,"salt-key");
    }
    
    if($Action && $Action ne ""){
        push(@args,$Action);
    }
    
    if($Name && $Name ne ""){
        push(@args, qq{"$Name"});
    }
    
    $ec->setProperty("/myCall/commandLine", join(" ",@args));
    
}
main();
