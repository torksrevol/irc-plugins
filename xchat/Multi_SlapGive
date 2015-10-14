#!/usr/bin/perl
#
# Commands: (also adds buttons)
# "/give Nick"         - Give random object to Nick from objects.txt
# "/slap Nick"         - As above, but abuse them with it first
# "/make Nick"         - Gives three random objects, asks Nick to build something
#
# v.0.9 - Also allows other people to prompt you to act with !slap, !give and !make
#
# Location for slap phrases: (Change username)
$file = "/home/USERNAME/.xchat2/addons/objects.txt";
# For Windows
#$file = "C:\Users\location_slaps"
# If in Windows the script doesn't found the file, please locate the file in "C:\Users\Username\" 

# Do you want this script to add its own easy-use buttons below userlist? 
# (Change to 0 if not)
$flslap_buttons=1;
#
# Do you want others to be able to prompt you? !slap, !give and !make
$flap_silly_triggers=1;

#================== End of user config===========
$flslap_version = "1.1";
Xchat::register( "Multi Slap/Give", $flslap_version, "/give, /make and /slap", "" );
Xchat::print "Loading Multi Slap/Give $flslap_version";

IRC::add_message_handler("PRIVMSG", "watch_slaptriggers");
IRC::add_command_handler("give", "give");
IRC::add_command_handler("slap", "slap");
IRC::add_command_handler("make", "make");

sub give {             # Randomly give an item to person from objects.txt       
         open (IN, "<$file") or (Xchat::print"Wo-oh File not found! (Path: $file)");
         rand($.) < 1 && ($line = $_) while <IN>; # Pick random line
         close(IN);
         chomp($line);
         # Change wording if required
         IRC::command("/me gives $_[0] $line.");
         return 1;
}
sub slap {             # Randomly slap somebody with an item to person from objects.txt
         open (IN, "<$file") or (Xchat::print"Wo-oh File not found! (Path: $file)");
         rand($.) < 1 && ($line = $_) while <IN>; # Pick random line
         close(IN);
         chomp($line);
         # Change wording if required
         IRC::command("/me slaps $_[0] around the head with $line.");
         return 1;
}

sub make {
         open (IN, "<$file") or (Xchat::print"Wo-oh File not found! (Path: $file)");
         rand($.) < 1 && ($line = $_) while <IN>; 
         close(IN);
         open (IN, "<$file") or (Xchat::print"Wo-oh File not found! (Path: $file)");
         rand($.) < 1 && ($line2 = $_) while <IN>; 
         close(IN);
         open (IN, "<$file") or (Xchat::print"Wo-oh File not found! (Path: $file)");
         rand($.) < 1 && ($line3 = $_) while <IN>; 
         close(IN);
         chomp($line);
         chomp($line2);
         chomp($line3);
         # Change wording if required
         IRC::command("/me gives $_[0] $line, $line2 and $line3 - what can you make of them?");
         return 1;
}

# Add buttons if required
if ($flslap_buttons =~ /1/) {
        IRC::command "/delbutton RandGive";
        IRC::command "/delbutton RandSlap";
        IRC::command "/delbutton RandMake";

        IRC::command "/addbutton RandGive give %s";
        IRC::command "/addbutton RandSlap slap %s";
        IRC::command "/addbutton RandMake make %s";
}

sub watch_slaptriggers {
       if ($flap_silly_triggers) {
               foreach $line (@_) {
                        $line =~ m/\:(.*?)\!(.*?)\sPRIVMSG\s(.*?)\s\:(.*)?/;

                        $m_nick = $1;
                        $m_send = $2;
                        $m_chan = $3;
                        $m_line = $4;

                        $m_line =~ s/^\s+//; # Remove trailing whitespace
                        $m_line =~ s/\s+$//;

                        if ($m_line =~ m/!slap/gi) { slap($m_nick); }
                        if ($m_line =~ m/!give/gi) { give($m_nick); }
                        if ($m_line =~ m/!make/gi) { make($m_nick); }
                        }
       }
}
# Seed rand once
srand;


