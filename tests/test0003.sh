#!/bin/bash

source ../boilerplate.sh

s1="Bash"
s2="Bash Boilerplate"
s3="And Now for Something Completely Different"

to_lower "$s1" l1
to_lower "$s2" l2
to_lower "$s3" l3

to_upper "$s1" u1
to_upper "$s2" u2
to_upper "$s3" u3

echo $l1
echo $l2
echo $l3

echo $u1
echo $u2
echo $u3
