#!/usr/local/bin/perl
use strict;


chdir "/root";
my $ok = `wget -c https://github.com/squizzster/ginstall/raw/master/cpan.tar`;

if (!-e "cpan.tar")  {
  print "CPAN TAR does not exist\n";
  exit 1;
}
`mkdir -p /gbooking/g-booking-server/install/cpan`;
if (!-e "/gbooking/g-booking-server/install/cpan")  {
  print "CPAN TAR does not exist\n";
  exit 1;
}


chdir "/gbooking/g-booking-server/install/cpan" or exit 1;

$ok = `tar -xf  /root/cpan.tar`;
$ok = `rm -f    /root/cpan.tar`;

print "g-booking CPAN installation via evaluation STARTED!\n";
my $count = 0;
my @cpan;

cpan();

foreach my $cpan_module (@cpan) {
  print "Attempting [$cpan_module]....";
  eval_and_install($cpan_module);
}

$ok = `rm -rf /gbooking/g-booking-server/install`;


sub eval_and_install {
  my $cpan_module = $_[0];
  print "Checking [$cpan_module]...";
  eval "use $cpan_module;";
  if ( $@ ) {
    $count++;
    print "Installing...";
    my $ok = `cpanm --mirror file:///gbooking/g-booking-server/install/cpan $cpan_module`;
    #Fetching file:///gbooking/g-booking-server/install/cpan/authors/id/T/TT/TTAR/Crypt-OpenSSL-AES-0.02.tar.gz ... FAIL
    if ( $ok=~m/FAIL$/ ) {
      if ( $ok=~m/(\/gbooking\/.*?authors\/id\/.*?)-[0-9]/ ) {
        my $file = $1;
        ###print "Attemping install directly from download directory $file...";
        my $ok = `cpanm --mirror file:///gbooking/g-booking-server/install/cpan $file*`;
        if ( $ok eq '' ) {
          print "FAILED on $file\n";
        }
        else {
          print "OK!\n";
        }
      }
    }
  }
  else {
    print "it's good.\n";
  }
  return 1;
}



sub check_and_create {
  my $cpan_module = $_[0];
  my $ok = `/usr/local/bin/cpanm --info $cpan_module`;
  chomp $ok;
  $ok=~/(.*?)\/(.*?)$/;

  if ( $1 ) {
    my $download   = "https://cpan.metacpan.org/authors/id/" .  substr($1,0,1) . "/" . substr($1,0,2) . "/" . $ok;
    my $local_dir  = "/gbooking/g-booking-server/install/cpan/authors/id" . "/" . substr($1,0,1) . "/" . substr($1,0,2) . "/" . $1;
    my $local_file = "/gbooking/g-booking-server/install/cpan/authors/id" . "/" . substr($1,0,1) . "/" . substr($1,0,2) . "/" . $1 . "/$2";

    mkdir "/gbooking/g-booking-server/install/cpan";
    mkdir "/gbooking/g-booking-server/install/cpan/authors/";
    mkdir "/gbooking/g-booking-server/install/cpan/authors/id";
    mkdir "/gbooking/g-booking-server/install/cpan/authors/id" . "/" . substr($1,0,1);
    mkdir "/gbooking/g-booking-server/install/cpan/authors/id" . "/" . substr($1,0,1) . "/" . substr($1,0,2);
    mkdir "/gbooking/g-booking-server/install/cpan/authors/id" . "/" . substr($1,0,1) . "/" . substr($1,0,2) . "/" . $1;

    if ( !-e $local_file ) {
      print "...DOWNLOADING...";
      my $exit = system ("curl -L '$download' >$local_file 2>/dev/null");
      if ( $exit != 0) {
        print "ERROR! $download\n";
        return;
      }
    }
  }
  print "DOWNLOAD SAYS OK!";
  return 1;
}



sub cpan {
  @cpan = (
   'Type::Tiny::XS',
   'Test::Needs',
   'Crypt::OpenSSL::AES',
   'Capture::Tiny',
   'Carp',
   'Code::ART',
   'common::sense',
   'Compress::LZ4Frame',
   'Crypt::CBC',
   'Crypt::JWT',
   'Crypt::Mode::CBC',
   'Crypt::PRNG',
   'Crypt::RC4',
   'Crypt::Twofish',
   'Crypt::RC4::XS',
   'Crypt::Rijndael',
   'Crypt::ScryptKDF',
   'Cwd',
   'Data::Dumper',
   'Data::Dumper::Concise',
   'Data::MessagePack',
   'Data::Password::zxcvbn',
   'Date::Manip',
   'DateTime',
   'DateTime::Duration',
   'DateTime::Format::ISO8601',
   'DateTime::Format::RFC3339',
   'DateTime::TimeZone',
   'DB_File',
   'DBI',
   'diagnostics',
   'Digest::CRC',
   'Digest::MD5',
   'Digest::SHA',
   'Digest::SHA1',
   'Digest::SHA3',
   'Email::SendGrid::V3',
   'Encode',
   'ExtUtils::Installed',
   'ExtUtils::Packlist',
   'Fcntl',
   'EV',
   'File::Copy',
   'File::Spec',
   'File::Tail',
   'Future::AsyncAwait',
   'Geo::IP2Location',
   'HTTP::BrowserDetect',
   'HTTP::Tiny',
   'Image::ExifTool',
   'IO::Prompter',
   'IO::Select',
   'IO::Socket',
   'IO::Socket::SSL',
   'IO::Socket::Timeout',
   'IPC::Cmd',
   'JSON',
   'JSON::XS',
   'Linux::Inotify2',
   'Linux::Systemd',
   'List::Util',
   'Log::Log4perl',
   'LWP',
   'LWP::Authen::OAuth2',
   'LWP::ConnCache',
   'LWP::Debug',
   'LWP::Simple',
   'LWP::UserAgent',
   'LWP::Protocol::https',
   'MIME::Base64',
   'Mojolicious',
   'Mojo::Redis',
   'Mojo::Transaction::WebSocket',
   'Net::SSLeay',
   'Net::DNS::Native',
   'Perl::Critic',
   'Perl::MinimumVersion',
   'POSIX',
   'Redis',
   'Redis::Fast',
   'Redis::Hash',
   'REST::Client',
   'Role::Tiny',
   'Scalar::Util',
   'Sereal::Decoder',
   'Sereal::Encoder',
   'Storable',
   'strictures',
   'String::CRC32',
   'String::Random',
   'Syntax::Keyword::Try',
   'Sys::Hostname',
   'Term::ANSIColor',
   'Term::ReadKey',
   'Text::CSV_XS',
   'Tie::DB_Lock',
   'Time::HiRes',
   'Time::HiRes::Value',
   'Time::Piece',
   'Time::Piece::MySQL',
   'Time::Seconds',
   'URI::Escape',
   'utf8::all',
   'WebService::Linode',
   'WWW::Google::APIDiscovery',
   'WWW::Telegram::BotAPI',
   'DBD::MariaDB',
   'YAML'
  );
}

