#!/bin/sh

# run the rest of the scripts using fish
apk update

apk add fish

fish setup.fish
