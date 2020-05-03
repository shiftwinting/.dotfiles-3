#!/bin/bash

is_file() {
    local file=$1

    [[ -f $file ]]
}

include () {
    is_file "$1" && source "$1"
}

