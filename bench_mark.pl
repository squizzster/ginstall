#!/usr/local/bin/perl

my ($cpu_events,  $mem_events,  $dsk_read,  $dsk_write) = "0.00";

my $test_cpu   = `/usr/bin/sysbench cpu    run`;
my $test_mem   = `/usr/bin/sysbench memory run`;

mkdir "/g_test";
chdir "/g_test";
my $test_dsk_p = `/usr/bin/sysbench fileio --file-total-size=5G prepare`;
my $test_dsk   = `/usr/bin/sysbench fileio --file-total-size=5G --file-test-mode=rndrw --time=60 --max-requests=0 run`; 
my $test_dsk_c = `/usr/bin/sysbench fileio --file-total-size=5G cleanup`;
rmdir "/g_test";

if ( $test_cpu=~m/events per second:.*?([0-9]+\.[0-9][0-9])/ ) {
  #   events per second:  1273.06
  $cpu_events = $1;
}

if ( $test_mem=~m/total number of events:.*?([0-9]+)/ ) {
  #   total number of events:              59926203
  $mem_events = $1;
}

if ( $test_dsk =~m/read, MiB.*?([0-9]+\.[0-9][0-9])/ ) {
  # read, MiB/s:                  4.28
  $dsk_read = $1;
}

if ( $test_dsk=~m/written, MiB.*?([0-9]+\.[0-9][0-9])/ ) {
  # written, MiB/s:               2.86
  $dsk_write = $1;
}

open(FH, '>', "/root/.g_bench_marks.txt") or die $!;
print FH "$cpu_events¬$mem_events¬$dsk_read¬$dsk_write\ncpu_events¬mem_events¬dsk_read¬dsk_write\n";
close FH;
chmod 0444, "/root/.g_bench_marks.txt";

exit;
#print "CPU = $cpu_events\n";
#print "MEM = $mem_events\n";
#print "DSKR= $dsk_read\n";
#print "DSKW= $dsk_write\n";
