#
# XChat Automatic Join on Invite.
# Version 1.0
# Perl
# 
IRC::print "\n\n\00312.::   XChat Automatic Join on Invite   ::.\003\n";

IRC::add_message_handler("INVITE", "invite_handler");

        sub invite_handler(){
                $nickL = IRC::get_info(1);
                $sh=shift(@_);
                @parts=split(" ",$sh);
                # 0=wer hat invited     1=INVITE                2=wen           3 wohin
                if (($parts[1] eq "INVITE")&&($parts[2] eq $nickL)){
                        $chan=substr($parts[3],1);
                        IRC::print("You have received a invite from #$chan\n");
                        IRC::command("/join #$chan");
                }
                return 1;
        }

