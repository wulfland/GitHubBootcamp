#!/bin/sh -l

echo "Hello $1"
echo "Welcome"

echo "::set-output name=time::$(date)"
