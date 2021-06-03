#!/usr/local/bin/perl
use strict;
use sigtrap 'handler' => \&sigtrap, 'HUP', 'INT','ABRT','QUIT','TERM';
use Syntax::Keyword::Try;

my $version = "1.0";

use strictures 2;
use utf8::all 'GLOBAL';
use warnings;
use feature qw(signatures);
no warnings qw(experimental::signatures);
use diagnostics;
enable diagnostics;
use Sys::Hostname; 
use Socket;
use Data::Dumper;
use IPC::Cmd qw[can_run run run_forked];
use String::Random qw(random_string);
use Crypt::CBC;
use Sereal::Encoder qw(:all);
use Sereal::Decoder qw(:all);
use JSON::XS;
use LWP;
use Digest::SHA1  qw(sha1 sha1_hex sha1_base64);
use POSIX;
$ENV{TZ} = 'UTC';
tzset();

my $encoder = Sereal::Encoder->new();
my $decoder = Sereal::Decoder->new();
my $ua = LWP::UserAgent->new();
$ua->agent("g_v$version"); 


use Log::Log4perl qw(:easy);
       ##file     => ">>/var/log/run_as_root_on_node_at_boot.log",
Log::Log4perl->easy_init( {
       layout   => '%d{yyyy-MM-dd HH:mm:ss} - %p - %F{1}-%L-%M - %m%n',
       level    => $INFO,
       file     => "STDOUT",
});

main ();
exit;



sub main {
  sleep 1; # some networks need an extra second.
  INFO "This server has rebooted... query who we are...";
  ## Let's get some basic stuff... 
  ## ... and add a fall-back IP incase something fails as we boot with FIREWALL FULL LOCKDOWN 
  my $emergency_ip_no = add_emergency_ip();
  my $host_name       = get_my_hostname ();
  my $my_server_ip_no = get_ipify       ();
  INFO "Server ($host_name) with IP [$my_server_ip_no] has rebooted."; 

  my $server_id    = get_file( '/root/.server.id' );
  my $alive_secret = get_file( '/root/.ccrypt.gbooking.system.alive' );

  if ( $server_id && $alive_secret ) {
    INFO "Server [$host_name] is already configured as g-booking server ID [$server_id].";
  }
  else {
    WARN "Server [$host_name] is currently unknown and not configured with g-booking.";
    first_time_check_in($my_server_ip_no, $host_name);
  }
}


sub first_time_check_in {
  ## This server is checking in for the first time.
  my $ip_no     = $_[0] or return;
  my $host_name = $_[1] or return;
  INFO "Attempting first time g-server check-in for [$ip_no]";
  ## We use AES encrpytion to perform an initial check-in using a SHA1 of our IPNO.
  ## Everything is over SSL anyway, so this is precautionary and the "secret" is also temporary. ;-)
  my $cipher_who_am_i = Crypt::CBC->new(
        -pass   => sha1($ip_no),
        -cipher => 'Cipher::AES',
        -pbkdf  => 'pbkdf2'
  );
  ## OK, let's say HELLO to the g G!

  my $command;
  $command->{ipno}     = $ip_no;
  $command->{epoch}    = time();
  $command->{uname}    = `/usr/bin/uname -a`;
  $command->{hostname} = $host_name;

  ## Send a HELLO COMMAND message.....
  my $response = get("https://api.g-booking.com/system/who/am/i?payload=" . unpack( "H*", $cipher_who_am_i->encrypt(sereal_encode_with_object($encoder, $command))));
  if ( $response->{_ok} == 400 ) {
    ## g-central command doesn't know who we are - so we cannot continue from here.... it's dead Jim.
    INFO  "Error 400 - don't know more and nothing more I can do."; 
    WARN  "I was unable to perform an initial security check-in.";
    FATAL "I've reached my natural end of life... good bye world";
    die "Argghhhhh";
  }

  if ( $response->{_ok} != 200 ) {
    FATAL "Something went wrong which is unexpected and should not happen.";
    die   "Suicide is very serious... yet I must commit it... :(  Arrggggg";
  }
  # g-central says aOK, we know you... you checked in within 5 minutes of being spinned up and you're in my database...
  # We should of recevied some special command codes unique to us.... 
  # These codes are pre-codes before the real codes....
  my $commands;
  
  try {
    my $response = decode_json ($response->{_content});
    $commands = $decoder->decode ($cipher_who_am_i->decrypt(pack("H*", $response->{message} ) ));
  }
  catch {
    FATAL "No command codes received in g-who-am-i message";
    die "No command codes";
  }
  INFO Dumper $commands;
  INFO "exit"; exit;
}


sub get_my_hostname {
  try {
    return  hostname();
  }
  catch {
  }
  WARN "Could not get the hostname of the server, assigning 'invalid'.";
  return "invalid.unknown.g-booking.com";
}


sub get {
  my $url = $_[0] or return;
  my $ret = http_get($url);
  while ( $ret->{_ok} != 200 && $ret->{_ok} != 400 ) {
    sleep 1;
    WARN "HTTP failed. ($url). ($ret->{_msg})";
    $ret = http_get($url);
  }
  return $ret;
}


sub get_ipify {
  my $ip_no = http_get("https://api.ipify.org");
  while ( $ip_no->{_ok} != 200 ) {
    WARN "Failed to get my IP address from https://api.ipify.org. ($ip_no->{_msg})";
    sleep 1;
    $ip_no = http_get("https://api.ipify.org");
  }
  return $ip_no->{_content};
}


sub add_emergency_ip {
  my $ip_no = get_emergency_ip();
  while ( not $ip_no =~m/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/ ) {
    $ip_no = get_emergency_ip();
  }
  firewall_cmd ( "--permanent --zone=public --add-rich-rule='  rule family=\"ipv4\"  source address=\"$ip_no\"   port protocol=\"tcp\" port=\"22\" accept'" );
  system_ctl   ( "reload", "firewalld" );
  INFO "I've added emergency IP [$ip_no] into the firewall table and reloaded the firewall.";
  return $ip_no; 
}


sub get_emergency_ip {
  try {
    return inet_ntoa(inet_aton('emergency.g-booking.com'));
  }
  catch {
    WARN "Emergency IP address error. $@";
    sleep 1;
    return "";
  }
}


sub firewall_cmd {
  return `/usr/bin/firewall-cmd $_[0] 2>&1` if $_[0] or return;
}


sub system_ctl {
  return `/usr/bin/systemctl $_[0] $_[1] 2>&1` if ( $_[0] and $_[1] ) or return; 
}


sub sigtrap {
 INFO "Caught a SIGNAL, and will exit...";
 exit;
}


sub http_get {
  return if not $_[0];
  my $url        = $_[0] or return;
  my $referer    = $_[1] || "https://g-booking.com";
  my $api;
  my $headers = ();
  $headers = $_[2] if defined $_[2];
  try {
    $ua->default_header('Referer' => $referer);
    $ua->timeout( 30 );
    $api = $ua->get( $url,  %$headers );
  }
  catch {
    ERROR "$@";
    return;
  }
  ERROR "HTTP GET error [$url]" and return if not defined $api->{_res} || not defined $api->{_res}{_rc};
  my $return_api;
  $return_api->{_msg}  = $api->{_msg};
  $return_api->{_ok}   = $api->{_rc};
  $return_api->{_ret}  = $api->{_rc};
  try {
    if ( $api->{_headers}{'content-type'}=~m/application\/json/ ) {
      $return_api->{_content} = decode_json ($api->{_content}) ;
    }
    else {
      $return_api->{_content}         = $api->{_content};
    }
    return $return_api;
  }
  catch {
    ERROR "$@";
  }
  return;
}


sub get_file {
  my $file_name = $_[0];
  my $file_contents;
  if ( -e $file_name ) {
    open(my $fh, '<', $file_name);
    my $read  = read ($fh, $file_contents, 262144000);
    close $fh;
    chomp $file_contents;
    return $file_contents;
  }
  return "";
}


