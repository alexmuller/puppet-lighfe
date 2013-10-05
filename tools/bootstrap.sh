#!/bin/bash

set -eu

sed -i 's|http://us|http://gb|' /etc/apt/sources.list
apt-get update
