#!/usr/local/bin/perl
use strict;

print "g-booking CPAN installation via evaluation STARTED!\n";
my $count = 0;
my @cpan;

cpan();

foreach my $cpan_module (@cpan) {
  print "Attempting [$cpan_module]....";
  eval "use $cpan_module;";
  if ( $@ ) {
    $count++;
    print "Installing  ($count)  [$cpan_module]..\n";
    my $ok = system("cpanm --mirror file:///root/cpan $cpan_module");
    if ( $ok != 0 ) {
       print STDOUT "FAILED => $cpan_module\n";
       print STDERR "FAILED => $cpan_module\n";
    }
  }
  else {
    print "OK!\n";
  }
}

sub cpan {
  @cpan = (
   'autodie',
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
   'Errno',
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
   'Mail::CheckUser',
   'MIME::Base64',
   'Mojolicious',
   'Mojo::Redis',
   'Mojo::Transaction::WebSocket',
   'Net::SSLeay',
   'open',
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
   'YAML'
  );
}

