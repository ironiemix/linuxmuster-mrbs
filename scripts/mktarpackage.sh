#!/bin/bash

# Create Tar Package out of mrbs debian Pakacke

VERSION=2.3

tar -cvzf tarfiles/linuxmuster-mrbs-$VERSION.tar.gz ./usr ./etc --exclude ".svn"
