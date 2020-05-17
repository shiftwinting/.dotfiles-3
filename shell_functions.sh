#!/bin/bash

is_file() {
    local file=$1

    [[ -f $file ]]
}

is_empty() {
    local var=$1

    [[ -z $var ]]
}
