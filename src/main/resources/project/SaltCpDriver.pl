# -------------------------------------------------------------------------
# Package
#    SaltCpDriver.pl
#
# Dependencies
#    None
#
# Purpose
#    Creates a command line to copy a file among several machines by using the salt-cp utility
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
    my $Path2Saltcp = ($ec->getProperty( "Path2Saltcp" ))->findvalue('//value')->string_value;
    my $Target      = ($ec->getProperty( "Target" ))->findvalue('//value')->string_value;
    my $Pcre        = ($ec->getProperty( "Pcre" ))->findvalue('//value')->string_value;
    my $Grain       = ($ec->getProperty( "Grain" ))->findvalue('//value')->string_value;
    my $Source      = ($ec->getProperty( "Source" ))->findvalue('//value')->string_value;
    my $Dest        = ($ec->getProperty( "Dest" ))->findvalue('//value')->string_value;
    
    my @args = ();
    
    if($Path2Saltcp && $Path2Saltcp ne ""){
        push(@args,qq{"$Path2Saltcp"});
    }else{
        push(@args,qq{"salt-cp"});
    }
    
    if($Grain eq 1){
        push(@args,"-G");
    }elsif($Pcre eq 1){
        push(@args,"-E");
    }
    
    if($Target && $Target ne ""){
        push(@args,qq{'$Target'});
    }else{
        push(@args,qq{'*'});
    }
    
    if($Source && $Source ne ""){
        push(@args,qq{"$Source"});
    }
    
    if($Dest && $Dest ne ""){
        push(@args,qq{"$Dest"});
    }
    
    $ec->setProperty("/myCall/commandLine", join(" ",@args));
    
}
main();
