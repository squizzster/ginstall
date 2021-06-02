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

## Let's get some basic stuff... 
## ... and add a fall-back IP incase something fails as we boot with FIREWALL FULL LOCKDOWN 
my $emergency_ip_no = add_emergency_ip();
my $host_name       = get_my_hostname ();
my $my_server_ip_no = get_ipify       ();

INFO "Server ($host_name) with IP [$my_server_ip_no] has rebooted."; 



exit;

sub get_my_hostname {
  try {
    return  hostname();
  }
  catch {
  }
  WARN "Could not get the hostname of the server, assigning 'invalid'.";
  return "invalid.unknown.g-booking.com";
}


sub get_ipify {
  my $ipno = `/usr/bin/curl -s 'https://api.ipify.org'`;
  while ( not $ipno =~m/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/ ) {
    WARN "Failed to get my IP address from https://api.ipify.org [$ipno]";
    sleep 1;
    $ipno = `/usr/bin/curl -s 'https://api.ipify.org'`;
  }
  return $ipno;
}


sub add_emergency_ip {
  my $ipno = get_emergency_ip();
  while ( not $ipno =~m/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/ ) {
    $ipno = get_emergency_ip();
  }
  firewall_cmd ( "--permanent --zone=public --add-rich-rule='  rule family=\"ipv4\"  source address=\"$ipno\"   port protocol=\"tcp\" port=\"22\" accept'" );
  system_ctl   ( "reload", "firewalld" );
  INFO "I've added emergency IP [$ipno] into the firewall table and reloaded the firewall.";
  return $ipno; 
}


sub get_emergency_ip {
  try {
    return inet_ntoa(inet_aton('emergency.g-booking.com'));
  }
  catch {
    WARN "Emergency IP address error. $@";
    sleep 2;
    return "";
  }
}


sub firewall_cmd {
  return `/usr/bin/firewall-cmd $_[0] 2>&1` if $_[0] or return;
}


sub system_ctl {
  return `/usr/bin/systemctl $_[0] $_[1] 2>&1` if ( $_[0] and $_[1] ) or return; 
}


