# Cache http credentials for one day while pull/push
git config --global credential.helper 'cache --timeout=86400'


# Create any number of files
touch hello{1..10}
# Add some text to those files
for i in {1..10}; do echo "Hello World" > hello${i}; done


# Access argument of last used command
mkdir new && cd $_
# In this case $_ = new

# Install packages from a folder in Ubuntu
for i in `ls path/to/folder`; do sudo dpkg -i /path/of/folder/$i; done

# Specific use case for regex.
# May not be much useful
# Put the list of vagrant boxes in list
vagrant box list > list
# The format of each line 	-> laravel/homestead    (virtualbox, 0.2.7)
# The format I required		-> laravel/homestead
												^no space here
# This is the command with which I reached that
sed -i -n 's/[ ]*\((\).*\()\)//p' list
# This list
# 	drifty/ionic-android
# 	laravel/homestead
# 	ubuntu/precise64
# 	ubuntu/trusty64
# 	ubuntu/trusty64-juju
#
# To make folder I replaced '/' with '-'
sed -i -n 's/\//-/p' list
# Became this list
# 	drifty-ionic-android
# 	laravel-homestead
# 	ubuntu-precise64
# 	ubuntu-trusty64
# 	ubuntu-trusty64-juju
# 	ubuntu-vivid64
#
# Vagrant init in each folder for the list
for i in `cat list`; do mkdir $i && cd $_; vagrant init `echo $i | sed -n 's/-/\//p'`; cd ..; done;
#	.
#	├── drifty-ionic-android
#	│   └── Vagrantfile
#	├── laravel-homestead
#	│   └── Vagrantfile
#	├── list
#	├── ubuntu-precise64
#	│   └── Vagrantfile
#	├── ubuntu-trusty64
#	│   └── Vagrantfile
#	├── ubuntu-trusty64-juju
#	│   └── Vagrantfile
#	└── ubuntu-vivid64
#	    └── Vagrantfile

# One more tough regex (:P) in renaming
# Changing downloaded tutorials

# ORIGINAL - [20150511][_P24mASZXHE] OpenStack Kilo - Installation on Ubuntu 15.04 ( Basic Environment ) (by chaal pritam).mp4
# REQUIRED - OpenStack Kilo - Installation on Ubuntu 15.04 Dashboard - Horizon.mp4
rename -v -n 's/(\[\d*\])(\[\w*\])([\s|\w]*-[\s|\w|\.]*)\(\s([\w|\s|\-]*)\s\)(.*)/$3$4.mp4/' *
rename -v 's/(\.04\s)([\w|\s]*)(\..*)/($2).mp4/g' *

# Copy a file to a remote machine
scp -P 2222 file.ext username@domain:~/

# Generate a new SSH key
ssh-keygen -t rsa -b 4096 -C "mbtamuli@gmail.com"
# Generate public key from private key
ssh-keygen -f <private_key> -y > <public_key>
# For example
ssh-keygen -f ~/.ssh/id_rsa -y > ~/.ssh/id_rsa.pub

# Select fields from a line
echo "One Two Three Four" | cut -f2,3 -d" "
OUTPUT: Two Three

# Check SHA256sums
sha256sum Fedora-Live-Workstation-x86_64-22-3.iso | cut -d " " -f1 | awk '{print ($1 == "615abfc89709a46a078dd1d39638019aa66f62b0ff8325334f1af100551bb6cf") ? "true" : "false" }'

# Rename video files to the same name as the srt files.
# example - 
# Mr.Robot.S01E02.HDTV.x264-KILLERS.mp4
# Mr. Robot - 01x02 - eps1.1_ones-and-zer0es.srt

# OUTPUT 
# Mr. Robot - 01x02 - eps1.1_ones-and-zer0es.mp4
# Mr. Robot - 01x02 - eps1.1_ones-and-zer0es.srt
for f in  Mr.Robot.S01E0*; do E="${f#*E}"; E="${E%%.*}"; file=( *" 01x$E "* ); echo mv "$f" "${file/.srt/}.${f##*.}"; done

# Find public ip address from terminal
curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'

# VPN using tunneling
sshuttle -r mbtamuli1994@mbtamuli1994.koding.io:443 0/0 -vv

# Mirror a site
nohup wget --limit-rate=200k --no-clobber --convert-links --random-wait -r -p -E -e robots=off -U mozilla http://www.example.com &

# Create an AP
create_ap --driver nl80211 wlxc46e1f189960 wlo1 lalala wifi1234

# Get another instance of a container's shell
docker exec -it <name> /bin/bash

# Docker container using apt-cacher-ng
RUN  echo 'Acquire::http { Proxy "http://dockerhost:3142"; };' >> /etc/apt/apt.conf.d/01proxy

# MongoDB Container
docker run -p 27017:27017 --name db -v /home/mbtamuli/workspace/virtual/docker/datadir:/data/db -d mongo
