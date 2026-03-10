#!/bin/bash

#Array
MOVIES=("RRR", "Murari", "Brindavanam")

#Size of the above array is 3
#Index will start with 0,1,2
echo "Movie names are: ${MOVIES[@]}"
echo "Name of the movie: ${MOVIES[2]}"