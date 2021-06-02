#!/usr/local/bin/perl
use strict;

print "g-booking CPAN installation via evaluation STARTED!\n";
my $count = 0;
my @cpan;

cpan();

foreach my $cpan_module (@cpan) {
  print "Attempting [$cpan_module]....";
  if ( not eval_and_install($cpan_module) ) {
    #print "Attempting download of [$cpan_module]...";
    #check_and_create($cpan_module);
    #print "RE-attempting [$cpan_module]....";
    #eval_and_install($cpan_module); 
  }
}

## and repeat
foreach my $cpan_module (@cpan) {
  print "Attempting [$cpan_module]....";
  if ( not eval_and_install($cpan_module) ) {
    #print "Attempting download of [$cpan_module]...";
    #check_and_create($cpan_module);
    #print "RE-attempting [$cpan_module]....";
    #eval_and_install($cpan_module); 
  }
}

sub eval_and_install {
  my $cpan_module = $_[0];
  print "Checking [$cpan_module]...";
  eval "use $cpan_module;";
  if ( $@ ) {
    $count++;
    print "it failed. Attemtping install...";
    my $ok = `cpanm --mirror file:///gbooking/g-booking-server/install/cpan $cpan_module`;
    #Fetching file:///gbooking/g-booking-server/install/cpan/authors/id/T/TT/TTAR/Crypt-OpenSSL-AES-0.02.tar.gz ... FAIL
    if ( $ok=~m/FAIL$/ ) {
      if ( $ok=~m/(\/gbooking\/.*?authors\/id\/.*?)-[0-9]/ ) {
        my $file = $1;
        print "Attemping install directly from download directory $file...";
        my $ok = `cpanm --mirror file:///gbooking/g-booking-server/install/cpan $file*`;
        if ( $ok eq '' ) {
          print "FAILED on $file\n";
        }
        else {
          print "Maybe OK!\n";
        }
      }
    }
    if ( $ok != 0 ) {
       print "FAILED.\n";
       return;
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
   'Test::Needs',
   'autodie',
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
   'File::Copy',
   'File::Spec',
   'File::Tail',
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
   'IPC::Shareable',
   'JSON',
   'JSON::XS',
   'Linux::Inotify2',
   'List::Util',
   'Log::Log4perl',
   'LWP',
   'LWP::Authen::OAuth2',
   'LWP::ConnCache',
   'LWP::Debug',
   'LWP::Simple',
   'LWP::UserAgent',
   'MIME::Base64',
   'Mojolicious',
   'Mojo::Redis',
   'Mojo::Transaction::WebSocket',
   'Net::SSLeay',
   'Perl::Critic',
   'Perl::MinimumVersion',
   'POSIX',
   'Redis',
   'Redis::Fast',
   'Redis::Hash',
   'REST::Client',
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
   'WWW::Google::APIDiscovery',
   'WWW::Telegram::BotAPI',
   'DBD::MariaDB',
   'YAML'
  );
}

