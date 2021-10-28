#!/bin/sh
mkdir /root/INSTALL_CPAN
cd /root/INSTALL_CPAN
wget -c http://www.cpan.org/authors/id/M/ML/MLEHMANN/common-sense-3.75.tar.gz http://www.cpan.org/authors/id/A/AU/AUTINITY/Compress-LZ4Frame-0.012002.tar.gz http://www.cpan.org/authors/id/M/MI/MIK/Crypt-JWT-0.033.tar.gz http://www.cpan.org/authors/id/I/IS/ISHIGAKI/JSON-4.03.tar.gz http://www.cpan.org/authors/id/T/TT/TTAR/Crypt-OpenSSL-AES-0.02.tar.gz http://www.cpan.org/authors/id/S/SI/SIFUKURT/Crypt-RC4-2.02.tar.gz http://www.cpan.org/authors/id/O/OY/OYAMA/Crypt-RC4-XS-0.02.tar.gz http://www.cpan.org/authors/id/L/LE/LEONT/Crypt-Rijndael-1.16.tar.gz http://www.cpan.org/authors/id/M/MI/MIK/Crypt-ScryptKDF-0.010.tar.gz http://www.cpan.org/authors/id/A/AM/AMS/Crypt-Twofish-2.18.tar.gz http://www.cpan.org/authors/id/N/NW/NWCLARK/Data-Dumper-2.183.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/Data-Dumper-Concise-2.023.tar.gz http://www.cpan.org/authors/id/S/SY/SYOHEX/Data-MessagePack-1.01.tar.gz http://www.cpan.org/authors/id/H/HI/HIDEAKIO/Module-Build-XSUtil-0.19.tar.gz http://www.cpan.org/authors/id/K/KA/KAZEBURO/Cwd-Guard-0.05.tar.gz http://www.cpan.org/authors/id/J/JK/JKEENAN/File-Copy-Recursive-Reduced-0.006.tar.gz http://www.cpan.org/authors/id/S/SY/SYOHEX/Devel-CheckCompiler-0.07.tar.gz http://www.cpan.org/authors/id/L/LE/LEONT/Module-Build-Tiny-0.039.tar.gz http://www.cpan.org/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-0.012.tar.gz http://www.cpan.org/authors/id/L/LE/LEONT/ExtUtils-Config-0.008.tar.gz http://www.cpan.org/authors/id/L/LE/LEONT/ExtUtils-Helpers-0.026.tar.gz http://www.cpan.org/authors/id/D/DA/DAKKAR/Data-Password-zxcvbn-1.0.4.tar.gz http://www.cpan.org/authors/id/D/DR/DROLSKY/List-AllUtils-0.19.tar.gz http://www.cpan.org/authors/id/P/PE/PEVANS/List-UtilsBy-0.11.tar.gz http://www.cpan.org/authors/id/P/PE/PEVANS/Scalar-List-Utils-1.60.tar.gz http://www.cpan.org/authors/id/D/DR/DROLSKY/List-SomeUtils-0.58.tar.gz http://www.cpan.org/authors/id/D/DR/DROLSKY/List-SomeUtils-XS-0.58.tar.gz http://www.cpan.org/authors/id/L/LE/LEEJO/Test-LeakTrace-0.17.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/JSON-MaybeXS-1.004003.tar.gz http://www.cpan.org/authors/id/R/RU/RURBAN/Cpanel-JSON-XS-4.27.tar.gz http://www.cpan.org/authors/id/O/OV/OVID/Test-Most-0.37.tar.gz http://www.cpan.org/authors/id/E/EX/EXODIST/Test-Exception-0.43.tar.gz http://www.cpan.org/authors/id/D/DA/DAGOLDEN/Sub-Uplevel-0.2800.tar.gz http://www.cpan.org/authors/id/D/DC/DCANTRELL/Test-Differences-0.68.tar.gz http://www.cpan.org/authors/id/N/NE/NEILB/Text-Diff-1.45.tar.gz http://www.cpan.org/authors/id/R/RJ/RJBS/Algorithm-Diff-1.201.tar.gz http://www.cpan.org/authors/id/B/BI/BIGJ/Test-Warn-0.36.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/Moose-2.2015.tar.gz http://www.cpan.org/authors/id/R/RE/REHSACK/Params-Util-1.102.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/Module-Runtime-Conflicts-0.003.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/Test-CleanNamespaces-0.24.tar.gz http://www.cpan.org/authors/id/D/DA/DAGOLDEN/File-pushd-1.016.tar.gz http://www.cpan.org/authors/id/R/RJ/RJBS/Sub-Exporter-0.988.tar.gz http://www.cpan.org/authors/id/R/RJ/RJBS/Data-OptList-0.112.tar.gz http://www.cpan.org/authors/id/R/RJ/RJBS/Sub-Install-0.928.tar.gz http://www.cpan.org/authors/id/I/IL/ILMARI/Devel-OverloadInfo-0.007.tar.gz http://www.cpan.org/authors/id/D/DR/DROLSKY/Package-DeprecationManager-0.17.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/Sub-Name-0.26.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/Class-Load-0.25.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/Class-Load-XS-0.10.tar.gz http://www.cpan.org/authors/id/H/HA/HAARG/Devel-GlobalDestruction-0.14.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/Data-Visitor-0.31.tar.gz http://www.cpan.org/authors/id/N/NU/NUFFIN/Tie-ToObject-0.03.tar.gz http://www.cpan.org/authors/id/D/DR/DROLSKY/DateTime-Format-ISO8601-0.16.tar.gz http://www.cpan.org/authors/id/D/DR/DROLSKY/DateTime-Format-Builder-0.83.tar.gz http://www.cpan.org/authors/id/D/DR/DROLSKY/Params-Validate-1.30.tar.gz http://www.cpan.org/authors/id/D/DR/DROLSKY/DateTime-Format-Strptime-1.79.tar.gz http://www.cpan.org/authors/id/I/IK/IKEGAMI/DateTime-Format-RFC3339-v1.2.0.tar.gz http://www.cpan.org/authors/id/P/PA/PALI/DBD-MariaDB-1.21.tar.gz http://www.cpan.org/authors/id/M/MA/MATTN/Devel-CheckLib-1.14.tar.gz http://www.cpan.org/authors/id/R/RU/RURBAN/Mock-Config-0.03.tar.gz http://www.cpan.org/authors/id/T/TI/TIMB/DBI-1.643.tar.gz http://www.cpan.org/authors/id/P/PM/PMQS/DB_File-1.856.tar.gz http://www.cpan.org/authors/id/O/OL/OLIMAUL/Digest-CRC-0.23.tar.gz http://www.cpan.org/authors/id/G/GA/GAAS/Digest-SHA1-2.13.tar.gz http://www.cpan.org/authors/id/G/GS/GSG/Email-SendGrid-V3-v0.900.1.tar.gz http://www.cpan.org/authors/id/D/DA/DANKOGAI/Encode-3.16.tar.gz http://www.cpan.org/authors/id/M/ML/MLEHMANN/EV-4.33.tar.gz http://www.cpan.org/authors/id/M/ML/MLEHMANN/Canary-Stability-2013.tar.gz http://www.cpan.org/authors/id/M/MG/MGRABNAR/File-Tail-1.3.tar.gz http://www.cpan.org/authors/id/P/PE/PEVANS/Future-AsyncAwait-0.54.tar.gz http://www.cpan.org/authors/id/P/PE/PEVANS/XS-Parse-Keyword-0.21.tar.gz http://www.cpan.org/authors/id/P/PE/PEVANS/ExtUtils-CChecker-0.11.tar.gz http://www.cpan.org/authors/id/P/PE/PEVANS/XS-Parse-Sublike-0.14.tar.gz http://www.cpan.org/authors/id/P/PE/PEVANS/Future-0.47.tar.gz http://www.cpan.org/authors/id/P/PE/PEVANS/Test-Identity-0.01.tar.gz http://www.cpan.org/authors/id/P/PE/PEVANS/Test-Refcount-0.10.tar.gz http://www.cpan.org/authors/id/L/LO/LOCATION/Geo-IP2Location-8.51.tar.gz http://www.cpan.org/authors/id/O/OA/OALDERS/HTTP-BrowserDetect-3.35.tar.gz http://www.cpan.org/authors/id/H/HA/HAARG/Test-NoWarnings-1.06.tar.gz http://www.cpan.org/authors/id/H/HE/HERMES/Hash-Merge-0.302.tar.gz http://www.cpan.org/authors/id/H/HE/HERMES/Clone-Choose-0.010.tar.gz http://www.cpan.org/authors/id/D/DA/DAGOLDEN/HTTP-Tiny-0.078.tar.gz http://www.cpan.org/authors/id/E/EX/EXIFTOOL/Image-ExifTool-12.30.tar.gz http://www.cpan.org/authors/id/D/DC/DCONWAY/IO-Prompter-0.004015.tar.gz http://www.cpan.org/authors/id/D/DC/DCONWAY/Contextual-Return-0.004014.tar.gz http://www.cpan.org/authors/id/R/RO/ROBIN/Want-0.29.tar.gz http://www.cpan.org/authors/id/T/TO/TODDR/IO-1.48.tar.gz http://www.cpan.org/authors/id/S/SU/SULLR/IO-Socket-SSL-2.072.tar.gz http://www.cpan.org/authors/id/C/CH/CHRISN/Net-SSLeay-1.90.tar.gz http://www.cpan.org/authors/id/A/AB/ABH/Mozilla-CA-20211001.tar.gz http://www.cpan.org/authors/id/D/DA/DAMS/IO-Socket-Timeout-0.32.tar.gz http://www.cpan.org/authors/id/D/DA/DAMS/PerlIO-via-Timeout-0.32.tar.gz http://www.cpan.org/authors/id/M/MI/MIYAGAWA/Test-TCP-2.22.tar.gz http://www.cpan.org/authors/id/E/EX/EXODIST/Test-SharedFork-0.35.tar.gz http://www.cpan.org/authors/id/M/ML/MLEHMANN/JSON-XS-4.03.tar.gz http://www.cpan.org/authors/id/M/ML/MLEHMANN/Types-Serialiser-1.01.tar.gz http://www.cpan.org/authors/id/M/ML/MLEHMANN/Linux-Inotify2-2.3.tar.gz http://www.cpan.org/authors/id/I/IO/IOANR/Linux-Systemd-1.201600.tar.gz http://www.cpan.org/authors/id/X/XA/XAOC/ExtUtils-PkgConfig-1.16.tar.gz http://www.cpan.org/authors/id/L/LE/LEONT/Test-CheckDeps-0.010.tar.gz http://www.cpan.org/authors/id/E/ET/ETJ/Log-Log4perl-1.54.tar.gz http://www.cpan.org/authors/id/O/OA/OALDERS/libwww-perl-6.58.tar.gz http://www.cpan.org/authors/id/O/OA/OALDERS/HTTP-Message-6.33.tar.gz http://www.cpan.org/authors/id/O/OA/OALDERS/URI-5.10.tar.gz http://www.cpan.org/authors/id/G/GA/GAAS/Encode-Locale-1.05.tar.gz http://www.cpan.org/authors/id/O/OA/OALDERS/LWP-MediaTypes-6.04.tar.gz http://www.cpan.org/authors/id/O/OA/OALDERS/HTTP-Date-6.05.tar.gz http://www.cpan.org/authors/id/A/AT/ATOOMIC/TimeDate-2.33.tar.gz http://www.cpan.org/authors/id/C/CJ/CJM/IO-HTML-1.004.tar.gz http://www.cpan.org/authors/id/M/MA/MALLEN/Test-RequiresInternet-0.05.tar.gz http://www.cpan.org/authors/id/O/OA/OALDERS/Net-HTTP-6.21.tar.gz http://www.cpan.org/authors/id/O/OA/OALDERS/HTML-Parser-3.76.tar.gz http://www.cpan.org/authors/id/P/PE/PETDANCE/HTML-Tagset-3.20.tar.gz http://www.cpan.org/authors/id/G/GA/GAAS/WWW-RobotRules-6.02.tar.gz http://www.cpan.org/authors/id/O/OA/OALDERS/HTTP-Daemon-6.12.tar.gz http://www.cpan.org/authors/id/P/PL/PLICEASE/File-Listing-6.14.tar.gz http://www.cpan.org/authors/id/O/OA/OALDERS/HTTP-Cookies-6.10.tar.gz http://www.cpan.org/authors/id/G/GA/GAAS/HTTP-Negotiate-6.01.tar.gz http://www.cpan.org/authors/id/D/DO/DOMM/LWP-Authen-OAuth2-0.18.tar.gz http://www.cpan.org/authors/id/O/OA/OALDERS/LWP-Protocol-https-6.10.tar.gz http://www.cpan.org/authors/id/S/SR/SRI/Mojolicious-9.22.tar.gz http://www.cpan.org/authors/id/J/JH/JHTHORSEN/Mojo-Redis-3.26.tar.gz http://www.cpan.org/authors/id/D/DB/DBOOK/Protocol-Redis-Faster-0.003.tar.gz http://www.cpan.org/authors/id/U/UN/UNDEF/Protocol-Redis-1.0011.tar.gz http://www.cpan.org/authors/id/O/OL/OLEG/Net-DNS-Native-0.22.tar.gz http://www.cpan.org/authors/id/P/PE/PETDANCE/Perl-Critic-1.140.tar.gz http://www.cpan.org/authors/id/S/SH/SHANCOCK/Perl-Tidy-20210717.tar.gz http://www.cpan.org/authors/id/M/MI/MITHALDU/PPI-1.270.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/Test-Object-0.08.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/Test-SubCalls-1.10.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/Hook-LexWrap-0.26.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/Task-Weaken-1.06.tar.gz http://www.cpan.org/authors/id/G/GA/GAAS/IO-String-1.08.tar.gz http://www.cpan.org/authors/id/A/AT/ATOOMIC/Clone-0.45.tar.gz http://www.cpan.org/authors/id/A/AT/ATOOMIC/B-COW-0.004.tar.gz http://www.cpan.org/authors/id/S/SA/SANKO/Readonly-2.05.tar.gz http://www.cpan.org/authors/id/W/WY/WYANT/PPIx-QuoteLike-0.018.tar.gz http://www.cpan.org/authors/id/W/WY/WYANT/PPIx-Regexp-0.081.tar.gz http://www.cpan.org/authors/id/P/PL/PLICEASE/File-Which-1.27.tar.gz http://www.cpan.org/authors/id/E/EL/ELLIOTJS/PPIx-Utilities-1.001000.tar.gz http://www.cpan.org/authors/id/R/RS/RSAVAGE/Config-Tiny-2.27.tgz http://www.cpan.org/authors/id/S/SR/SREZIC/String-Format-1.18.tar.gz http://www.cpan.org/authors/id/R/RE/REHSACK/List-MoreUtils-0.430.tar.gz http://www.cpan.org/authors/id/R/RE/REHSACK/List-MoreUtils-XS-0.430.tar.gz http://www.cpan.org/authors/id/R/RU/RURBAN/B-Keywords-1.22.tar.gz http://www.cpan.org/authors/id/D/DO/DOLMEN/Pod-Spell-1.20.tar.gz http://www.cpan.org/authors/id/D/DC/DCONWAY/Lingua-EN-Inflect-1.905.tar.gz http://www.cpan.org/authors/id/D/DB/DBOOK/Perl-MinimumVersion-1.40.tar.gz http://www.cpan.org/authors/id/E/ET/ETHER/File-Find-Rule-Perl-1.15.tar.gz http://www.cpan.org/authors/id/D/DB/DBOOK/PPIx-Utils-0.003.tar.gz http://www.cpan.org/authors/id/D/DA/DAMS/Redis-1.998.tar.gz http://www.cpan.org/authors/id/S/SH/SHOGO/Redis-Fast-0.32.tar.gz http://www.cpan.org/authors/id/F/FU/FUJIWARA/Test-UNIXSock-0.4.tar.gz http://www.cpan.org/authors/id/Y/YA/YANICK/Parallel-ForkManager-2.02.tar.gz http://www.cpan.org/authors/id/K/KK/KKANE/REST-Client-273.tar.gz http://www.cpan.org/authors/id/Y/YV/YVES/Sereal-Decoder-4.018.tar.gz http://www.cpan.org/authors/id/R/RG/RGARCIA/Test-LongString-0.17.tar.gz http://www.cpan.org/authors/id/Y/YV/YVES/Sereal-Encoder-4.018.tar.gz http://www.cpan.org/authors/id/N/NW/NWCLARK/Storable-3.25.tar.gz http://www.cpan.org/authors/id/L/LE/LEEJO/String-CRC32-2.100.tar.gz http://www.cpan.org/authors/id/S/SH/SHLOMIF/String-Random-0.32.tar.gz http://www.cpan.org/authors/id/P/PE/PEVANS/Syntax-Keyword-Try-0.26.tar.gz http://www.cpan.org/authors/id/J/JS/JSTOWE/TermReadKey-2.38.tar.gz http://www.cpan.org/authors/id/H/HM/HMBRAND/Text-CSV_XS-1.46.tgz http://www.cpan.org/authors/id/K/KW/KWILLIAMS/Tie-DB_Lock-0.07.tar.gz http://www.cpan.org/authors/id/P/PE/PEVANS/Time-HiRes-Value-0.08.tar.gz http://www.cpan.org/authors/id/K/KA/KASEI/Time-Piece-MySQL-0.06.tar.gz http://www.cpan.org/authors/id/H/HA/HAYOBAAN/utf8-all-0.024.tar.gz http://www.cpan.org/authors/id/L/LE/LEONT/PerlIO-utf8_strict-0.008.tar.gz http://www.cpan.org/authors/id/H/HA/HAARG/Import-Into-1.002005.tar.gz http://www.cpan.org/authors/id/M/MI/MIKEGRB/WebService-Linode-0.29.tar.gz http://www.cpan.org/authors/id/M/MA/MANWAR/WWW-Google-APIDiscovery-0.28.tar.gz http://www.cpan.org/authors/id/M/MA/MANWAR/WWW-Google-UserAgent-0.23.tar.gz http://www.cpan.org/authors/id/R/RJ/RJBS/Throwable-1.000.tar.gz http://www.cpan.org/authors/id/R/RO/ROBERTOF/WWW-Telegram-BotAPI-0.12.tar.gz http://www.cpan.org/authors/id/T/TI/TINITA/YAML-1.30.tar.gz http://www.cpan.org/authors/id/T/TI/TINITA/Test-YAML-1.07.tar.gz http://www.cpan.org/authors/id/I/IN/INGY/Test-Base-0.89.tar.gz http://www.cpan.org/authors/id/I/IN/INGY/Spiffy-0.46.tar.gz 

mkdir -p ./authors/id/M/ML/MLEHMANN ./authors/id/A/AU/AUTINITY ./authors/id/M/MI/MIK ./authors/id/I/IS/ISHIGAKI ./authors/id/T/TT/TTAR ./authors/id/S/SI/SIFUKURT ./authors/id/O/OY/OYAMA ./authors/id/L/LE/LEONT ./authors/id/M/MI/MIK ./authors/id/A/AM/AMS ./authors/id/N/NW/NWCLARK ./authors/id/E/ET/ETHER ./authors/id/S/SY/SYOHEX ./authors/id/H/HI/HIDEAKIO ./authors/id/K/KA/KAZEBURO ./authors/id/J/JK/JKEENAN ./authors/id/S/SY/SYOHEX ./authors/id/L/LE/LEONT ./authors/id/L/LE/LEONT ./authors/id/L/LE/LEONT ./authors/id/L/LE/LEONT ./authors/id/D/DA/DAKKAR ./authors/id/D/DR/DROLSKY ./authors/id/P/PE/PEVANS ./authors/id/P/PE/PEVANS ./authors/id/D/DR/DROLSKY ./authors/id/D/DR/DROLSKY ./authors/id/L/LE/LEEJO ./authors/id/E/ET/ETHER ./authors/id/R/RU/RURBAN ./authors/id/O/OV/OVID ./authors/id/E/EX/EXODIST ./authors/id/D/DA/DAGOLDEN ./authors/id/D/DC/DCANTRELL ./authors/id/N/NE/NEILB ./authors/id/R/RJ/RJBS ./authors/id/B/BI/BIGJ ./authors/id/E/ET/ETHER ./authors/id/R/RE/REHSACK ./authors/id/E/ET/ETHER ./authors/id/E/ET/ETHER ./authors/id/D/DA/DAGOLDEN ./authors/id/R/RJ/RJBS ./authors/id/R/RJ/RJBS ./authors/id/R/RJ/RJBS ./authors/id/I/IL/ILMARI ./authors/id/D/DR/DROLSKY ./authors/id/E/ET/ETHER ./authors/id/E/ET/ETHER ./authors/id/E/ET/ETHER ./authors/id/H/HA/HAARG ./authors/id/E/ET/ETHER ./authors/id/N/NU/NUFFIN ./authors/id/D/DR/DROLSKY ./authors/id/D/DR/DROLSKY ./authors/id/D/DR/DROLSKY ./authors/id/D/DR/DROLSKY ./authors/id/I/IK/IKEGAMI ./authors/id/P/PA/PALI ./authors/id/M/MA/MATTN ./authors/id/R/RU/RURBAN ./authors/id/T/TI/TIMB ./authors/id/P/PM/PMQS ./authors/id/O/OL/OLIMAUL ./authors/id/G/GA/GAAS ./authors/id/G/GS/GSG ./authors/id/D/DA/DANKOGAI ./authors/id/M/ML/MLEHMANN ./authors/id/M/ML/MLEHMANN ./authors/id/M/MG/MGRABNAR ./authors/id/P/PE/PEVANS ./authors/id/P/PE/PEVANS ./authors/id/P/PE/PEVANS ./authors/id/P/PE/PEVANS ./authors/id/P/PE/PEVANS ./authors/id/P/PE/PEVANS ./authors/id/P/PE/PEVANS ./authors/id/L/LO/LOCATION ./authors/id/O/OA/OALDERS ./authors/id/H/HA/HAARG ./authors/id/H/HE/HERMES ./authors/id/H/HE/HERMES ./authors/id/D/DA/DAGOLDEN ./authors/id/E/EX/EXIFTOOL ./authors/id/D/DC/DCONWAY ./authors/id/D/DC/DCONWAY ./authors/id/R/RO/ROBIN ./authors/id/T/TO/TODDR ./authors/id/S/SU/SULLR ./authors/id/C/CH/CHRISN ./authors/id/A/AB/ABH ./authors/id/D/DA/DAMS ./authors/id/D/DA/DAMS ./authors/id/M/MI/MIYAGAWA ./authors/id/E/EX/EXODIST ./authors/id/M/ML/MLEHMANN ./authors/id/M/ML/MLEHMANN ./authors/id/M/ML/MLEHMANN ./authors/id/I/IO/IOANR ./authors/id/X/XA/XAOC ./authors/id/L/LE/LEONT ./authors/id/E/ET/ETJ ./authors/id/O/OA/OALDERS ./authors/id/O/OA/OALDERS ./authors/id/O/OA/OALDERS ./authors/id/G/GA/GAAS ./authors/id/O/OA/OALDERS ./authors/id/O/OA/OALDERS ./authors/id/A/AT/ATOOMIC ./authors/id/C/CJ/CJM ./authors/id/M/MA/MALLEN ./authors/id/O/OA/OALDERS ./authors/id/O/OA/OALDERS ./authors/id/P/PE/PETDANCE ./authors/id/G/GA/GAAS ./authors/id/O/OA/OALDERS ./authors/id/P/PL/PLICEASE ./authors/id/O/OA/OALDERS ./authors/id/G/GA/GAAS ./authors/id/D/DO/DOMM ./authors/id/O/OA/OALDERS ./authors/id/S/SR/SRI ./authors/id/J/JH/JHTHORSEN ./authors/id/D/DB/DBOOK ./authors/id/U/UN/UNDEF ./authors/id/O/OL/OLEG ./authors/id/P/PE/PETDANCE ./authors/id/S/SH/SHANCOCK ./authors/id/M/MI/MITHALDU ./authors/id/E/ET/ETHER ./authors/id/E/ET/ETHER ./authors/id/E/ET/ETHER ./authors/id/E/ET/ETHER ./authors/id/G/GA/GAAS ./authors/id/A/AT/ATOOMIC ./authors/id/A/AT/ATOOMIC ./authors/id/S/SA/SANKO ./authors/id/W/WY/WYANT ./authors/id/W/WY/WYANT ./authors/id/P/PL/PLICEASE ./authors/id/E/EL/ELLIOTJS ./authors/id/R/RS/RSAVAGE ./authors/id/S/SR/SREZIC ./authors/id/R/RE/REHSACK ./authors/id/R/RE/REHSACK ./authors/id/R/RU/RURBAN ./authors/id/D/DO/DOLMEN ./authors/id/D/DC/DCONWAY ./authors/id/D/DB/DBOOK ./authors/id/E/ET/ETHER ./authors/id/D/DB/DBOOK ./authors/id/D/DA/DAMS ./authors/id/S/SH/SHOGO ./authors/id/F/FU/FUJIWARA ./authors/id/Y/YA/YANICK ./authors/id/K/KK/KKANE ./authors/id/Y/YV/YVES ./authors/id/R/RG/RGARCIA ./authors/id/Y/YV/YVES ./authors/id/N/NW/NWCLARK ./authors/id/L/LE/LEEJO ./authors/id/S/SH/SHLOMIF ./authors/id/P/PE/PEVANS ./authors/id/J/JS/JSTOWE ./authors/id/H/HM/HMBRAND ./authors/id/K/KW/KWILLIAMS ./authors/id/P/PE/PEVANS ./authors/id/K/KA/KASEI ./authors/id/H/HA/HAYOBAAN ./authors/id/L/LE/LEONT ./authors/id/H/HA/HAARG ./authors/id/M/MI/MIKEGRB ./authors/id/M/MA/MANWAR ./authors/id/M/MA/MANWAR ./authors/id/R/RJ/RJBS ./authors/id/R/RO/ROBERTOF ./authors/id/T/TI/TINITA ./authors/id/T/TI/TINITA ./authors/id/I/IN/INGY ./authors/id/I/IN/INGY 

ln ./common-sense-3.75.tar.gz ./authors/id/M/ML/MLEHMANN
ln ./Compress-LZ4Frame-0.012002.tar.gz ./authors/id/A/AU/AUTINITY
ln ./Crypt-JWT-0.033.tar.gz ./authors/id/M/MI/MIK
ln ./JSON-4.03.tar.gz ./authors/id/I/IS/ISHIGAKI
ln ./Crypt-OpenSSL-AES-0.02.tar.gz ./authors/id/T/TT/TTAR
ln ./Crypt-RC4-2.02.tar.gz ./authors/id/S/SI/SIFUKURT
ln ./Crypt-RC4-XS-0.02.tar.gz ./authors/id/O/OY/OYAMA
ln ./Crypt-Rijndael-1.16.tar.gz ./authors/id/L/LE/LEONT
ln ./Crypt-ScryptKDF-0.010.tar.gz ./authors/id/M/MI/MIK
ln ./Crypt-Twofish-2.18.tar.gz ./authors/id/A/AM/AMS
ln ./Data-Dumper-2.183.tar.gz ./authors/id/N/NW/NWCLARK
ln ./Data-Dumper-Concise-2.023.tar.gz ./authors/id/E/ET/ETHER
ln ./Data-MessagePack-1.01.tar.gz ./authors/id/S/SY/SYOHEX
ln ./Module-Build-XSUtil-0.19.tar.gz ./authors/id/H/HI/HIDEAKIO
ln ./Cwd-Guard-0.05.tar.gz ./authors/id/K/KA/KAZEBURO
ln ./File-Copy-Recursive-Reduced-0.006.tar.gz ./authors/id/J/JK/JKEENAN
ln ./Devel-CheckCompiler-0.07.tar.gz ./authors/id/S/SY/SYOHEX
ln ./Module-Build-Tiny-0.039.tar.gz ./authors/id/L/LE/LEONT
ln ./ExtUtils-InstallPaths-0.012.tar.gz ./authors/id/L/LE/LEONT
ln ./ExtUtils-Config-0.008.tar.gz ./authors/id/L/LE/LEONT
ln ./ExtUtils-Helpers-0.026.tar.gz ./authors/id/L/LE/LEONT
ln ./Data-Password-zxcvbn-1.0.4.tar.gz ./authors/id/D/DA/DAKKAR
ln ./List-AllUtils-0.19.tar.gz ./authors/id/D/DR/DROLSKY
ln ./List-UtilsBy-0.11.tar.gz ./authors/id/P/PE/PEVANS
ln ./Scalar-List-Utils-1.60.tar.gz ./authors/id/P/PE/PEVANS
ln ./List-SomeUtils-0.58.tar.gz ./authors/id/D/DR/DROLSKY
ln ./List-SomeUtils-XS-0.58.tar.gz ./authors/id/D/DR/DROLSKY
ln ./Test-LeakTrace-0.17.tar.gz ./authors/id/L/LE/LEEJO
ln ./JSON-MaybeXS-1.004003.tar.gz ./authors/id/E/ET/ETHER
ln ./Cpanel-JSON-XS-4.27.tar.gz ./authors/id/R/RU/RURBAN
ln ./Test-Most-0.37.tar.gz ./authors/id/O/OV/OVID
ln ./Test-Exception-0.43.tar.gz ./authors/id/E/EX/EXODIST
ln ./Sub-Uplevel-0.2800.tar.gz ./authors/id/D/DA/DAGOLDEN
ln ./Test-Differences-0.68.tar.gz ./authors/id/D/DC/DCANTRELL
ln ./Text-Diff-1.45.tar.gz ./authors/id/N/NE/NEILB
ln ./Algorithm-Diff-1.201.tar.gz ./authors/id/R/RJ/RJBS
ln ./Test-Warn-0.36.tar.gz ./authors/id/B/BI/BIGJ
ln ./Moose-2.2015.tar.gz ./authors/id/E/ET/ETHER
ln ./Params-Util-1.102.tar.gz ./authors/id/R/RE/REHSACK
ln ./Module-Runtime-Conflicts-0.003.tar.gz ./authors/id/E/ET/ETHER
ln ./Test-CleanNamespaces-0.24.tar.gz ./authors/id/E/ET/ETHER
ln ./File-pushd-1.016.tar.gz ./authors/id/D/DA/DAGOLDEN
ln ./Sub-Exporter-0.988.tar.gz ./authors/id/R/RJ/RJBS
ln ./Data-OptList-0.112.tar.gz ./authors/id/R/RJ/RJBS
ln ./Sub-Install-0.928.tar.gz ./authors/id/R/RJ/RJBS
ln ./Devel-OverloadInfo-0.007.tar.gz ./authors/id/I/IL/ILMARI
ln ./Package-DeprecationManager-0.17.tar.gz ./authors/id/D/DR/DROLSKY
ln ./Sub-Name-0.26.tar.gz ./authors/id/E/ET/ETHER
ln ./Class-Load-0.25.tar.gz ./authors/id/E/ET/ETHER
ln ./Class-Load-XS-0.10.tar.gz ./authors/id/E/ET/ETHER
ln ./Devel-GlobalDestruction-0.14.tar.gz ./authors/id/H/HA/HAARG
ln ./Data-Visitor-0.31.tar.gz ./authors/id/E/ET/ETHER
ln ./Tie-ToObject-0.03.tar.gz ./authors/id/N/NU/NUFFIN
ln ./DateTime-Format-ISO8601-0.16.tar.gz ./authors/id/D/DR/DROLSKY
ln ./DateTime-Format-Builder-0.83.tar.gz ./authors/id/D/DR/DROLSKY
ln ./Params-Validate-1.30.tar.gz ./authors/id/D/DR/DROLSKY
ln ./DateTime-Format-Strptime-1.79.tar.gz ./authors/id/D/DR/DROLSKY
ln ./DateTime-Format-RFC3339-v1.2.0.tar.gz ./authors/id/I/IK/IKEGAMI
ln ./DBD-MariaDB-1.21.tar.gz ./authors/id/P/PA/PALI
ln ./Devel-CheckLib-1.14.tar.gz ./authors/id/M/MA/MATTN
ln ./Mock-Config-0.03.tar.gz ./authors/id/R/RU/RURBAN
ln ./DBI-1.643.tar.gz ./authors/id/T/TI/TIMB
ln ./DB_File-1.856.tar.gz ./authors/id/P/PM/PMQS
ln ./Digest-CRC-0.23.tar.gz ./authors/id/O/OL/OLIMAUL
ln ./Digest-SHA1-2.13.tar.gz ./authors/id/G/GA/GAAS
ln ./Email-SendGrid-V3-v0.900.1.tar.gz ./authors/id/G/GS/GSG
ln ./Encode-3.16.tar.gz ./authors/id/D/DA/DANKOGAI
ln ./EV-4.33.tar.gz ./authors/id/M/ML/MLEHMANN
ln ./Canary-Stability-2013.tar.gz ./authors/id/M/ML/MLEHMANN
ln ./File-Tail-1.3.tar.gz ./authors/id/M/MG/MGRABNAR
ln ./Future-AsyncAwait-0.54.tar.gz ./authors/id/P/PE/PEVANS
ln ./XS-Parse-Keyword-0.21.tar.gz ./authors/id/P/PE/PEVANS
ln ./ExtUtils-CChecker-0.11.tar.gz ./authors/id/P/PE/PEVANS
ln ./XS-Parse-Sublike-0.14.tar.gz ./authors/id/P/PE/PEVANS
ln ./Future-0.47.tar.gz ./authors/id/P/PE/PEVANS
ln ./Test-Identity-0.01.tar.gz ./authors/id/P/PE/PEVANS
ln ./Test-Refcount-0.10.tar.gz ./authors/id/P/PE/PEVANS
ln ./Geo-IP2Location-8.51.tar.gz ./authors/id/L/LO/LOCATION
ln ./HTTP-BrowserDetect-3.35.tar.gz ./authors/id/O/OA/OALDERS
ln ./Test-NoWarnings-1.06.tar.gz ./authors/id/H/HA/HAARG
ln ./Hash-Merge-0.302.tar.gz ./authors/id/H/HE/HERMES
ln ./Clone-Choose-0.010.tar.gz ./authors/id/H/HE/HERMES
ln ./HTTP-Tiny-0.078.tar.gz ./authors/id/D/DA/DAGOLDEN
ln ./Image-ExifTool-12.30.tar.gz ./authors/id/E/EX/EXIFTOOL
ln ./IO-Prompter-0.004015.tar.gz ./authors/id/D/DC/DCONWAY
ln ./Contextual-Return-0.004014.tar.gz ./authors/id/D/DC/DCONWAY
ln ./Want-0.29.tar.gz ./authors/id/R/RO/ROBIN
ln ./IO-1.48.tar.gz ./authors/id/T/TO/TODDR
ln ./IO-Socket-SSL-2.072.tar.gz ./authors/id/S/SU/SULLR
ln ./Net-SSLeay-1.90.tar.gz ./authors/id/C/CH/CHRISN
ln ./Mozilla-CA-20211001.tar.gz ./authors/id/A/AB/ABH
ln ./IO-Socket-Timeout-0.32.tar.gz ./authors/id/D/DA/DAMS
ln ./PerlIO-via-Timeout-0.32.tar.gz ./authors/id/D/DA/DAMS
ln ./Test-TCP-2.22.tar.gz ./authors/id/M/MI/MIYAGAWA
ln ./Test-SharedFork-0.35.tar.gz ./authors/id/E/EX/EXODIST
ln ./JSON-XS-4.03.tar.gz ./authors/id/M/ML/MLEHMANN
ln ./Types-Serialiser-1.01.tar.gz ./authors/id/M/ML/MLEHMANN
ln ./Linux-Inotify2-2.3.tar.gz ./authors/id/M/ML/MLEHMANN
ln ./Linux-Systemd-1.201600.tar.gz ./authors/id/I/IO/IOANR
ln ./ExtUtils-PkgConfig-1.16.tar.gz ./authors/id/X/XA/XAOC
ln ./Test-CheckDeps-0.010.tar.gz ./authors/id/L/LE/LEONT
ln ./Log-Log4perl-1.54.tar.gz ./authors/id/E/ET/ETJ
ln ./libwww-perl-6.58.tar.gz ./authors/id/O/OA/OALDERS
ln ./HTTP-Message-6.33.tar.gz ./authors/id/O/OA/OALDERS
ln ./URI-5.10.tar.gz ./authors/id/O/OA/OALDERS
ln ./Encode-Locale-1.05.tar.gz ./authors/id/G/GA/GAAS
ln ./LWP-MediaTypes-6.04.tar.gz ./authors/id/O/OA/OALDERS
ln ./HTTP-Date-6.05.tar.gz ./authors/id/O/OA/OALDERS
ln ./TimeDate-2.33.tar.gz ./authors/id/A/AT/ATOOMIC
ln ./IO-HTML-1.004.tar.gz ./authors/id/C/CJ/CJM
ln ./Test-RequiresInternet-0.05.tar.gz ./authors/id/M/MA/MALLEN
ln ./Net-HTTP-6.21.tar.gz ./authors/id/O/OA/OALDERS
ln ./HTML-Parser-3.76.tar.gz ./authors/id/O/OA/OALDERS
ln ./HTML-Tagset-3.20.tar.gz ./authors/id/P/PE/PETDANCE
ln ./WWW-RobotRules-6.02.tar.gz ./authors/id/G/GA/GAAS
ln ./HTTP-Daemon-6.12.tar.gz ./authors/id/O/OA/OALDERS
ln ./File-Listing-6.14.tar.gz ./authors/id/P/PL/PLICEASE
ln ./HTTP-Cookies-6.10.tar.gz ./authors/id/O/OA/OALDERS
ln ./HTTP-Negotiate-6.01.tar.gz ./authors/id/G/GA/GAAS
ln ./LWP-Authen-OAuth2-0.18.tar.gz ./authors/id/D/DO/DOMM
ln ./LWP-Protocol-https-6.10.tar.gz ./authors/id/O/OA/OALDERS
ln ./Mojolicious-9.22.tar.gz ./authors/id/S/SR/SRI
ln ./Mojo-Redis-3.26.tar.gz ./authors/id/J/JH/JHTHORSEN
ln ./Protocol-Redis-Faster-0.003.tar.gz ./authors/id/D/DB/DBOOK
ln ./Protocol-Redis-1.0011.tar.gz ./authors/id/U/UN/UNDEF
ln ./Net-DNS-Native-0.22.tar.gz ./authors/id/O/OL/OLEG
ln ./Perl-Critic-1.140.tar.gz ./authors/id/P/PE/PETDANCE
ln ./Perl-Tidy-20210717.tar.gz ./authors/id/S/SH/SHANCOCK
ln ./PPI-1.270.tar.gz ./authors/id/M/MI/MITHALDU
ln ./Test-Object-0.08.tar.gz ./authors/id/E/ET/ETHER
ln ./Test-SubCalls-1.10.tar.gz ./authors/id/E/ET/ETHER
ln ./Hook-LexWrap-0.26.tar.gz ./authors/id/E/ET/ETHER
ln ./Task-Weaken-1.06.tar.gz ./authors/id/E/ET/ETHER
ln ./IO-String-1.08.tar.gz ./authors/id/G/GA/GAAS
ln ./Clone-0.45.tar.gz ./authors/id/A/AT/ATOOMIC
ln ./B-COW-0.004.tar.gz ./authors/id/A/AT/ATOOMIC
ln ./Readonly-2.05.tar.gz ./authors/id/S/SA/SANKO
ln ./PPIx-QuoteLike-0.018.tar.gz ./authors/id/W/WY/WYANT
ln ./PPIx-Regexp-0.081.tar.gz ./authors/id/W/WY/WYANT
ln ./File-Which-1.27.tar.gz ./authors/id/P/PL/PLICEASE
ln ./PPIx-Utilities-1.001000.tar.gz ./authors/id/E/EL/ELLIOTJS
ln ./Config-Tiny-2.27.tgz ./authors/id/R/RS/RSAVAGE
ln ./String-Format-1.18.tar.gz ./authors/id/S/SR/SREZIC
ln ./List-MoreUtils-0.430.tar.gz ./authors/id/R/RE/REHSACK
ln ./List-MoreUtils-XS-0.430.tar.gz ./authors/id/R/RE/REHSACK
ln ./B-Keywords-1.22.tar.gz ./authors/id/R/RU/RURBAN
ln ./Pod-Spell-1.20.tar.gz ./authors/id/D/DO/DOLMEN
ln ./Lingua-EN-Inflect-1.905.tar.gz ./authors/id/D/DC/DCONWAY
ln ./Perl-MinimumVersion-1.40.tar.gz ./authors/id/D/DB/DBOOK
ln ./File-Find-Rule-Perl-1.15.tar.gz ./authors/id/E/ET/ETHER
ln ./PPIx-Utils-0.003.tar.gz ./authors/id/D/DB/DBOOK
ln ./Redis-1.998.tar.gz ./authors/id/D/DA/DAMS
ln ./Redis-Fast-0.32.tar.gz ./authors/id/S/SH/SHOGO
ln ./Test-UNIXSock-0.4.tar.gz ./authors/id/F/FU/FUJIWARA
ln ./Parallel-ForkManager-2.02.tar.gz ./authors/id/Y/YA/YANICK
ln ./REST-Client-273.tar.gz ./authors/id/K/KK/KKANE
ln ./Sereal-Decoder-4.018.tar.gz ./authors/id/Y/YV/YVES
ln ./Test-LongString-0.17.tar.gz ./authors/id/R/RG/RGARCIA
ln ./Sereal-Encoder-4.018.tar.gz ./authors/id/Y/YV/YVES
ln ./Storable-3.25.tar.gz ./authors/id/N/NW/NWCLARK
ln ./String-CRC32-2.100.tar.gz ./authors/id/L/LE/LEEJO
ln ./String-Random-0.32.tar.gz ./authors/id/S/SH/SHLOMIF
ln ./Syntax-Keyword-Try-0.26.tar.gz ./authors/id/P/PE/PEVANS
ln ./TermReadKey-2.38.tar.gz ./authors/id/J/JS/JSTOWE
ln ./Text-CSV_XS-1.46.tgz ./authors/id/H/HM/HMBRAND
ln ./Tie-DB_Lock-0.07.tar.gz ./authors/id/K/KW/KWILLIAMS
ln ./Time-HiRes-Value-0.08.tar.gz ./authors/id/P/PE/PEVANS
ln ./Time-Piece-MySQL-0.06.tar.gz ./authors/id/K/KA/KASEI
ln ./utf8-all-0.024.tar.gz ./authors/id/H/HA/HAYOBAAN
ln ./PerlIO-utf8_strict-0.008.tar.gz ./authors/id/L/LE/LEONT
ln ./Import-Into-1.002005.tar.gz ./authors/id/H/HA/HAARG
ln ./WebService-Linode-0.29.tar.gz ./authors/id/M/MI/MIKEGRB
ln ./WWW-Google-APIDiscovery-0.28.tar.gz ./authors/id/M/MA/MANWAR
ln ./WWW-Google-UserAgent-0.23.tar.gz ./authors/id/M/MA/MANWAR
ln ./Throwable-1.000.tar.gz ./authors/id/R/RJ/RJBS
ln ./WWW-Telegram-BotAPI-0.12.tar.gz ./authors/id/R/RO/ROBERTOF
ln ./YAML-1.30.tar.gz ./authors/id/T/TI/TINITA
ln ./Test-YAML-1.07.tar.gz ./authors/id/T/TI/TINITA
ln ./Test-Base-0.89.tar.gz ./authors/id/I/IN/INGY
ln ./Spiffy-0.46.tar.gz ./authors/id/I/IN/INGY


cpanm -v --mirror file:///root/INSTALL_CPAN common-sense-3.75.tar.gz Compress-LZ4Frame-0.012002.tar.gz Crypt-JWT-0.033.tar.gz JSON-4.03.tar.gz Crypt-OpenSSL-AES-0.02.tar.gz Crypt-RC4-2.02.tar.gz Crypt-RC4-XS-0.02.tar.gz Crypt-Rijndael-1.16.tar.gz Crypt-ScryptKDF-0.010.tar.gz Crypt-Twofish-2.18.tar.gz Data-Dumper-2.183.tar.gz Data-Dumper-Concise-2.023.tar.gz Data-MessagePack-1.01.tar.gz Module-Build-XSUtil-0.19.tar.gz Cwd-Guard-0.05.tar.gz File-Copy-Recursive-Reduced-0.006.tar.gz Devel-CheckCompiler-0.07.tar.gz Module-Build-Tiny-0.039.tar.gz ExtUtils-InstallPaths-0.012.tar.gz ExtUtils-Config-0.008.tar.gz ExtUtils-Helpers-0.026.tar.gz Data-Password-zxcvbn-1.0.4.tar.gz List-AllUtils-0.19.tar.gz List-UtilsBy-0.11.tar.gz Scalar-List-Utils-1.60.tar.gz List-SomeUtils-0.58.tar.gz List-SomeUtils-XS-0.58.tar.gz Test-LeakTrace-0.17.tar.gz JSON-MaybeXS-1.004003.tar.gz Cpanel-JSON-XS-4.27.tar.gz Test-Most-0.37.tar.gz Test-Exception-0.43.tar.gz Sub-Uplevel-0.2800.tar.gz Test-Differences-0.68.tar.gz Text-Diff-1.45.tar.gz Algorithm-Diff-1.201.tar.gz Test-Warn-0.36.tar.gz Moose-2.2015.tar.gz Params-Util-1.102.tar.gz Module-Runtime-Conflicts-0.003.tar.gz Test-CleanNamespaces-0.24.tar.gz File-pushd-1.016.tar.gz Sub-Exporter-0.988.tar.gz Data-OptList-0.112.tar.gz Sub-Install-0.928.tar.gz Devel-OverloadInfo-0.007.tar.gz Package-DeprecationManager-0.17.tar.gz Sub-Name-0.26.tar.gz Class-Load-0.25.tar.gz Class-Load-XS-0.10.tar.gz Devel-GlobalDestruction-0.14.tar.gz Data-Visitor-0.31.tar.gz Tie-ToObject-0.03.tar.gz DateTime-Format-ISO8601-0.16.tar.gz DateTime-Format-Builder-0.83.tar.gz Params-Validate-1.30.tar.gz DateTime-Format-Strptime-1.79.tar.gz DateTime-Format-RFC3339-v1.2.0.tar.gz DBD-MariaDB-1.21.tar.gz Devel-CheckLib-1.14.tar.gz Mock-Config-0.03.tar.gz DBI-1.643.tar.gz DB_File-1.856.tar.gz Digest-CRC-0.23.tar.gz Digest-SHA1-2.13.tar.gz Email-SendGrid-V3-v0.900.1.tar.gz Encode-3.16.tar.gz EV-4.33.tar.gz Canary-Stability-2013.tar.gz File-Tail-1.3.tar.gz Future-AsyncAwait-0.54.tar.gz XS-Parse-Keyword-0.21.tar.gz ExtUtils-CChecker-0.11.tar.gz XS-Parse-Sublike-0.14.tar.gz Future-0.47.tar.gz Test-Identity-0.01.tar.gz Test-Refcount-0.10.tar.gz Geo-IP2Location-8.51.tar.gz HTTP-BrowserDetect-3.35.tar.gz Test-NoWarnings-1.06.tar.gz Hash-Merge-0.302.tar.gz Clone-Choose-0.010.tar.gz HTTP-Tiny-0.078.tar.gz Image-ExifTool-12.30.tar.gz IO-Prompter-0.004015.tar.gz Contextual-Return-0.004014.tar.gz Want-0.29.tar.gz IO-1.48.tar.gz IO-Socket-SSL-2.072.tar.gz Net-SSLeay-1.90.tar.gz Mozilla-CA-20211001.tar.gz IO-Socket-Timeout-0.32.tar.gz PerlIO-via-Timeout-0.32.tar.gz Test-TCP-2.22.tar.gz Test-SharedFork-0.35.tar.gz JSON-XS-4.03.tar.gz Types-Serialiser-1.01.tar.gz Linux-Inotify2-2.3.tar.gz Linux-Systemd-1.201600.tar.gz ExtUtils-PkgConfig-1.16.tar.gz Test-CheckDeps-0.010.tar.gz Log-Log4perl-1.54.tar.gz libwww-perl-6.58.tar.gz HTTP-Message-6.33.tar.gz URI-5.10.tar.gz Encode-Locale-1.05.tar.gz LWP-MediaTypes-6.04.tar.gz HTTP-Date-6.05.tar.gz TimeDate-2.33.tar.gz IO-HTML-1.004.tar.gz Test-RequiresInternet-0.05.tar.gz Net-HTTP-6.21.tar.gz HTML-Parser-3.76.tar.gz HTML-Tagset-3.20.tar.gz WWW-RobotRules-6.02.tar.gz HTTP-Daemon-6.12.tar.gz File-Listing-6.14.tar.gz HTTP-Cookies-6.10.tar.gz HTTP-Negotiate-6.01.tar.gz LWP-Authen-OAuth2-0.18.tar.gz LWP-Protocol-https-6.10.tar.gz Mojolicious-9.22.tar.gz Mojo-Redis-3.26.tar.gz Protocol-Redis-Faster-0.003.tar.gz Protocol-Redis-1.0011.tar.gz Net-DNS-Native-0.22.tar.gz Perl-Critic-1.140.tar.gz Perl-Tidy-20210717.tar.gz PPI-1.270.tar.gz Test-Object-0.08.tar.gz Test-SubCalls-1.10.tar.gz Hook-LexWrap-0.26.tar.gz Task-Weaken-1.06.tar.gz IO-String-1.08.tar.gz Clone-0.45.tar.gz B-COW-0.004.tar.gz Readonly-2.05.tar.gz PPIx-QuoteLike-0.018.tar.gz PPIx-Regexp-0.081.tar.gz File-Which-1.27.tar.gz PPIx-Utilities-1.001000.tar.gz Config-Tiny-2.27.tgz String-Format-1.18.tar.gz List-MoreUtils-0.430.tar.gz List-MoreUtils-XS-0.430.tar.gz B-Keywords-1.22.tar.gz Pod-Spell-1.20.tar.gz Lingua-EN-Inflect-1.905.tar.gz Perl-MinimumVersion-1.40.tar.gz File-Find-Rule-Perl-1.15.tar.gz PPIx-Utils-0.003.tar.gz Redis-1.998.tar.gz Redis-Fast-0.32.tar.gz Test-UNIXSock-0.4.tar.gz Parallel-ForkManager-2.02.tar.gz REST-Client-273.tar.gz Sereal-Decoder-4.018.tar.gz Test-LongString-0.17.tar.gz Sereal-Encoder-4.018.tar.gz Storable-3.25.tar.gz String-CRC32-2.100.tar.gz String-Random-0.32.tar.gz Syntax-Keyword-Try-0.26.tar.gz TermReadKey-2.38.tar.gz Text-CSV_XS-1.46.tgz Tie-DB_Lock-0.07.tar.gz Time-HiRes-Value-0.08.tar.gz Time-Piece-MySQL-0.06.tar.gz utf8-all-0.024.tar.gz PerlIO-utf8_strict-0.008.tar.gz Import-Into-1.002005.tar.gz WebService-Linode-0.29.tar.gz WWW-Google-APIDiscovery-0.28.tar.gz WWW-Google-UserAgent-0.23.tar.gz Throwable-1.000.tar.gz WWW-Telegram-BotAPI-0.12.tar.gz YAML-1.30.tar.gz Test-YAML-1.07.tar.gz Test-Base-0.89.tar.gz Spiffy-0.46.tar.gz   >cpan_install.log  2>cpan_install.err

