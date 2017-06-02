#!/bin/env zsh

rm -f cards/*.txt
root -b -l "produceCards.C(\"${1}\", \"${2}\")"
