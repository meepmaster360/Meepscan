
# Meepscan 
v1.2.1

==========


Meepscan
----------
Meepscan is a simple program for using nmap using only open ports.

First confirms user root privileges.

Then internet connection.

After verifies and installs nmap.

Ask for IP.

Nmap open ports.

Nmap with -sC, -sV, -A, -Pn options.


Nmap
----------
Nmap is released under a custom license, which is based on (but not compatible
with) GPLv2. The Nmap license allows free usage by end users, and we also offer
a commercial license for companies that wish to redistribute Nmap technology
with their products. See [Nmap Copyright and Licensing](https://nmap.org/book/man-legal.html)
for full details.

The latest version of this software as well as binary installers for Windows,
macOS, and Linux (RPM) are available from
[Nmap.org](https://nmap.org/download.html)

Full documentation is also available
on the [Nmap.org website](https://nmap.org/docs.html).

Questions and suggestions may be sent to the
[Nmap-dev mailing list](https://nmap.org/mailman/listinfo/dev).


Installing
----------
Ideally, you should be able to just type:

    Choose directory
    
    git clone git@github.com:meepmaster360/meepscan.git
    
    cd meepscan
    
    $sudo bash meescan.sh or $chmod +x meepscan.sh and the always $sudo ./meepscan.sh


Using Nmap
----------
Nmap has a lot of features, but getting started is as easy as running `nmap
scanme.nmap.org`. Running `nmap` without any parameters will give a helpful
list of the most common options, which are discussed in depth in [the man
page](https://nmap.org/book/man.html). Users who prefer a graphical interface
can use the included [Zenmap front-end](https://nmap.org/zenmap/).


Using meepscan
----------

    In the correct directory (/meepscan/)
    $sudo bash meepscan.sh
    or
    $chmod +x meepscan.sh (only once)
    $sudo ./meepscan.sh
    #./meepscan.sh (root user)


Version style
----------
v1.0.0

v *.*.* - Version

v1.*.* - Major Changes / New Functions

v*.0.* - New Tools / New Directory

v*.*.0 - Minor Changes


Contributing
------------
Information about filing bug reports and contributing to the meepscan project can
be found in the [BUGHOUSE](BUGHOUSE) and [CONTRIBUTING.md](CONTRIBUTING.md)
files.


# This Script Was Made By @meepmaster360
