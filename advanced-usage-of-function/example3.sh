#!/bin/bash
function calculate
{
    case "$2" in
        +)
            echo "`expr $1 + $3`";
            ;;
        -)
            echo "`expr $1 - $3`";
            ;;
        \*)
            echo "`expr $1 \* $3`";
            ;;
        /)
            echo "`expr $1 / $3`";
            ;;
    esac
}

calculate $1 $2 $3
