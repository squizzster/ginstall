#!/usr/local/bin/perl
use warnings;
use common::sense;
use Term::ANSIColor;
use Term::ReadKey;
use Cwd;
use Term::ReadKey;
use Digest::CRC qw(crc8);

ReadMode 1;             # same as ReadMode 'normal'


my $VERSION  = "1.01";
my $MYARGV = $ARGV[0];
my $ok;
my $secret_text;
my $cur_dir = getcwd;
my $crc = 57;
my $crypt_1;
my $crypt_2;
my $green = colored("                            ", 'green on_green');
my $red =   colored("                            ", 'red on_red');

$| = 1;

## First they need to make the key files available.. so let's check.

if ( $< != 0 ) {
  print "Cannot continue as I am not root\n";
  print  "  Are you sure you know what you are doing?\n";
  sleep 5;
  die "Drink coffee";
}

while ( -d "/gbooking" ) {
  print "Cannot continue as /gbooking already exists...";
  print  "  Are you sure you know what you are doing?\n";
  sleep 5;
  die "Drink coffee";
}

if ( !-e '/etc/redhat-release' ) {
  print "Sorry, system must be RedHat Enterprise 8 or binary compatible to continue.\n";
  print  "  Are you sure you know what you are doing?\n";
  sleep 5;
  die "Drink coffee";
}

my ($crc8, $key_1, $key_2, $key_3, $colour);
$key_1  = "";
$key_2  = "";
$key_3  = "";
$colour = "";
$crc8  = -1;
my $newline = "\n" x 200;

# Let's check files in case they are already there....
if ( -e '/root/.ccrypt.gbooking' && -e '/root/.ccrypt.gbooking.make') {
  open(FH, '<', '/root/.ccrypt.gbooking') or die $!;
  $key_1 = <FH>;
  $key_2 = <FH>;
  open(FH, '<', '/root/.ccrypt.gbooking.make') or die $!;
  $key_3 = <FH>;
  chomp $key_1;
  chomp $key_2;
  chomp $key_3;
  $colour = "r" . "e" . "d";   ## fooled you !
  $crc8 = crc8("$key_1$key_2$key_3");
}


while  ( $crc8 != $crc  ) {    
  ### Highly secure... they will never guess CRC16 and your favourite colour
  #   Very clever Mark. IDIOt!  Get serious, this is an important script!
  ### Copyright 2021 Mark Arnold.  Do not copy this idea.. Thank you.
  print $newline;
  print "g-Booking [$VERSION] server installation started.";
  print "\nThunderbir...\n";
  Term::ReadKey::ReadMode('noecho');
  
  print "\n      What is your favourite colour? ";
  $colour = Term::ReadKey::ReadLine(0);

  print "\nWhat was the name of your first pet? ";
  $colour = Term::ReadKey::ReadLine(0); # ok stop

  print "\n   Enter g-booking secret key ALPHA: ";
  $key_1 = Term::ReadKey::ReadLine(0);
  
  print "\n    Enter g-booking secret key BETA: ";
  $key_2 = Term::ReadKey::ReadLine(0);
  
  print "\n Enter g-booking secret key CHARLIE: ";
  $key_3 = Term::ReadKey::ReadLine(0);

  
  Term::ReadKey::ReadMode('restore');
  print "\n";
  chomp $key_1;
  chomp $key_2;
  chomp $key_3;
  chomp $colour;
  $crc8 = crc8("$key_1$key_2$key_3");

  if ( $crc8 == $crc ) {
    print $green x 20000;
    print " " x 20000;
  }
  else {
    print $red x 20000;
    print " " x 20000;
  }

}

## OK, let's get serious.
open(FH, '>', '/root/.ccrypt.gbooking') or die $!;
close FH;
open(FH, '>', '/root/.ccrypt.gbooking.make') or die $!;
close FH;

my $ok = chmod 0000, "/root/.ccrypt.gbooking", "/root/.ccrypt.gbooking.make";
if ( $ok != 2 ) {
  die "Not a clue....check your filesystem for errors.";
}

open(FH, '>>', '/root/.ccrypt.gbooking') or die $!;
print FH "$key_1\n";
print FH "$key_2\n";
close FH;

open(FH, '>>', '/root/.ccrypt.gbooking.make') or die $!;
print FH "$key_3\n";
close FH;

my $ok = chmod 0000, "/root/.ccrypt.gbooking", "/root/.ccrypt.gbooking.make";
if ( $ok != 2 ) {
  die "Not a clue....check your filesystem for errors.";
}
my $install_type = "";

while ( $install_type ne 'REST_API' && $install_type ne 'SQL_MASTER' && $install_type ne 'SQL_SLAVE' && $install_type ne 'TASK' && $install_type ne 'GEO') {
  print "\n\n\ng-Booking [$VERSION] server installation.";
  print "\nThunderbirds are GO!\n";
  print "\n";
  print "Please specify the server installation type:\n";
  print " REST_API     - A clustered API server dealing with incoming REST requests.\n";
  print " SQL_MASTER   - Master SQL cluster.\n";
  print " SQL_SLAVE    - SLAVE SQL cluster.\n";
  print " TASK         - Task and process management server.\n";
  print " GEO          - Geographic and GEO information requests.\n";
  print "\n";
  print "  Server type =>";

  $install_type = Term::ReadKey::ReadLine(0);
  chomp $install_type;
}

$ok = x("Grabbing a local copy of encode_decode",  "wget -c https://github.com/squizzster/ginstall/raw/master/encode_decode");
 rename "./encode_decode", "/usr/local/bin/encode_decode";
 chmod 0555, "/usr/local/bin/encode_decode";
 unlink "./encode_decode";

#####   GET MAIN Rclone SYSTEM FILES WHICH ALLOW ACCESS TO EVERYTHING ######
mkdir "/root";
mkdir "/root/.config";
mkdir "/root/.config/rclone";

open(FH, '>', '/root/.config/rclone/rclone.conf') or die $!; close FH; 
chmod 0000, "/root/.config/rclone/rclone.conf";

if  ( not x("Installing rclone configuration to directly access g-storage systems.",  "curl -L https://github.com/squizzster/ginstall/raw/master/rclone.conf 2>/dev/null | base64 -d | openssl enc -pass file:/root/.ccrypt.gbooking.make -d -iter 5000000 -pbkdf2 -aes256 | sed s/^/_____g_booking_password_encrypted_file_v1.0_____/ | encode_decode >>/root/.config/rclone/rclone.conf") ) {
  print "Rclone configuration update didn't return as expected. Please re-run.\n"; 
  die "This should not happen"; 
}

$ok = x("Creating /gbooking directory",                "mkdir /gbooking", 256);
$ok = x("Creating /gbooking/g-booking directory",      "mkdir /gbooking/g-booking", 256);
$ok = x("Creating /gbooking/g-booking/tmp directory",  "mkdir /gbooking/g-booking/tmp", 256);
chmod (0700, "/gbooking/g-booking/tmp") or die "Cannot chmod file";

$ok = x("Enabling memcached, redis, mariadb", "systemctl enable memcached redis mariadb");
$ok = x("Starting memcached, redis, mariadb", "systemctl start memcached redis mariadb");
$ok = x("Upgrading mysql tables",             "mysql_upgrade");
$ok = x("Adding time zone information", "mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql");

## in tmp directory which is protected
chdir ("/gbooking/g-booking/tmp" or die "cannot change: $!\n");
$ok = x("Downloading protected system files", "rclone copy backup:/BACKUPS/every_8hours_for_31days/system-root-files--always_latest-.v$VERSION.tar.cpt /gbooking/g-booking/tmp");
chmod (0400, "/gbooking/g-booking/tmp/system-root-files--always_latest-.v$VERSION.tar.cpt") or die "Cannot chmod file";

$ok = x("Decrypting system files",      "ccrypt -fd -k /root/.ccrypt.gbooking /gbooking/g-booking/tmp/system-root-files--always_latest-.v$VERSION.tar.cpt");
$ok = x("UnTar system files",           "tar -xpf /gbooking/g-booking/tmp/system-root-files--always_latest-.v$VERSION.tar");

$ok = x("Remove tar file",           "rm -f /gbooking/g-booking/tmp/system-root-files--always_latest-.v$VERSION.tar");

$ok = x("Copying and overwriting system files",      "\\cp -drfp /gbooking/g-booking/tmp/* /");
$ok = x("Removing system files",           "rm -rf /gbooking/g-booking/tmp");

## remove some stufff...
##chdir  $cur_dir;

##$ok = x("Removing setup files",  "rm -rf cpan_bundle cpan_list.txt encode_decode ginstall.tar.ssl rclone.conf g_booking_run_second.pl install_g_booking_run_first.sh");
##$ok = x("Removing setup files",  "rm -rf /gbooking");
##$ok = x("Creating /gbooking directory",                "mkdir /gbooking");


chdir "/gbooking";

$ok = x("Cloning g-booking",   'git clone git@github.com:squizzster/g-booking-server.git');


$ok = x("Setting selinux to allow https to connect externally",  "setsebool -P httpd_can_network_connect=1");



chdir "/root";
# do some cleanup then
$ok = x("Clean up /root",  "rm -rf /root/ginstall* /root/cpan* /root/perl* /root/ccrypt*");
rmdir "/gbooking/g-booking";

print "\n\n\n\n\nTHUNDERBIRDS ARE GO!!!\n\n";


exit;

sub check_file_permissions {
  my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size, $atime,$mtime,$ctime,$blksize,$blocks) = stat('/root/.ccrypt.gbooking');
  return 1 if $mode == 32768 && $uid == 0 && $gid == 0;
  print STDERR "The secret file has the wrong permissions. Normal file with chmod 000, root/root please.\n";
  return;
}


sub check_password_sizes {
  open(my $fh, '<', '/root/.ccrypt.gbooking');
  $crypt_1 = <$fh>;
  $crypt_2 = <$fh>;
  chomp $crypt_1;
  chomp $crypt_2;
  return 1 if length($crypt_1) == 512 && length($crypt_2) == 512;
  return;
}

sub x {
  my ($name, $system, $ok_error) = @_;
  print "-> $name \n";
  $ok_error = $ok_error || 999999999;
  $system =~ s/\r|\n//g; # remove my rubbish
  my $ok = system("$system 2>/dev/null");
  return 1 if not $ok;
  return 1 if $ok == $ok_error;
  print "\n\nSomething went wrong $ok\n\n";
  die;
}

sub xcr {
  my ($name, $system, $ok_error) = @_;
  print "-> $name \n";
  $ok_error = $ok_error || 999999999;
  my $ok = system("$system 2>/dev/null");
  return 1 if not $ok;
  return 1 if $ok == $ok_error;
  print "\n\nSomething went wrong $ok\n\n";
  die;
}


