#!/usr/local/bin/perl
use strict;
use strictures 2;
use utf8::all 'GLOBAL';
use warnings;
use feature qw(signatures);
no warnings qw(experimental::signatures);
use diagnostics;
enable diagnostics;

use Syntax::Keyword::Try;
use Sys::Hostname; 
use Socket;
use Log::Log4perl qw(:easy);
       ##file     => ">>/var/log/run_as_root_on_node_at_boot.log",
Log::Log4perl->easy_init( {
       layout   => '%d{yyyy-MM-dd HH:mm:ss} - %p - %F{1}-%L-%M - %m%n',
       level    => $INFO,
       file     => "STDOUT",
});

my $gbooking_emergency_ip = "";
my $host_name = get_my_hostname();

INFO "Server [$host_name} has rebooted."; sleep 1;

add_emergency_ip();




exit;

sub get_my_hostname {
  try {
    return  hostname();
  }
  catch {
  }
  return "invalid.unknown.g-booking.com";
}



sub add_emergency_ip {
  INFO "Adding an emergency firewall IP number";
  while ( not $gbooking_emergency_ip =~m/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/ ) {
    $gbooking_emergency_ip = get_emergency_ip();
  }
  firewall_cmd ( "--permanent --zone=public --add-rich-rule='  rule family=\"ipv4\"  source address=\"$gbooking_emergency_ip\"   port protocol=\"tcp\" port=\"22\" accept'" );
  system_ctl   ( "reload", "firewalld" );
  INFO "I've added emergency IP [$gbooking_emergency_ip] into the firewall table and reloaded the firewall.";
}


sub get_emergency_ip {
  try {
    return inet_ntoa(inet_aton('emergency.g-booking.com'));
  }
  catch {
    WARN "Emergency address error. $@";
    sleep 2;
    return "";
  }
}


sub firewall_cmd {
  return `/usr/bin/firewall-cmd $_[0] 2>&1` if $_[0] or return;
}


sub system_ctl {
  return `/usr/bin/systemctl $_[0] $_[1]` if ( $_[0] and $_[1] ) or return; 
}


