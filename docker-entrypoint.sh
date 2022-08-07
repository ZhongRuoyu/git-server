#!/bin/sh

service ssh start
git daemon --base-path=/home/git --export-all --reuseaddr /home/git
