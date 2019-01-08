# -------------------------------------------------------------------------
# Package
#    SaltDriver.pl
#
# Dependencies
#    None
#
# Purpose
#    Creates a command line to call salt 
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
    my $Path2Salt       = ($ec->getProperty( "Path2Salt" ))->findvalue('//value')->string_value;
    my $OutputFormat    = ($ec->getProperty( "OutputFormat" ))->findvalue('//value')->string_value;
    my $Target          = ($ec->getProperty( "Target" ))->findvalue('//value')->string_value;
    my $Pcre            = ($ec->getProperty( "Pcre" ))->findvalue('//value')->string_value;
    my $Grain           = ($ec->getProperty( "Grain" ))->findvalue('//value')->string_value;
    my $Module          = ($ec->getProperty( "Module" ))->findvalue('//value')->string_value;
    my $ModuleArgs      = ($ec->getProperty( "ModuleArgs" ))->findvalue('//value')->string_value;
    
    my @args = ();
    
    if($Path2Salt && $Path2Salt ne ""){
        push(@args,qq{"$Path2Salt"});
    }else{
        push(@args,"salt");
    }
    
    if($OutputFormat && $OutputFormat ne ""){
        push(@args,$OutputFormat);
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
    
    if($Module && $Module ne ""){
        push(@args, $Module);
    }
    
    if($ModuleArgs && $ModuleArgs ne ""){
        push(@args,$ModuleArgs);
    }
    
    $ec->setProperty("/myCall/commandLine", join(" ",@args));
    
}
main();

