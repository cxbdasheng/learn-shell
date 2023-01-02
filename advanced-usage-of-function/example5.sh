#!/bin/bash
var1="Hello world"

function test
{
    var2=87
    local var3=86
    echo $var3
}
echo $var1
echo $var2
echo $var3

test

echo $var1
echo $var2
echo $var3

function test1
{
    echo $var2
    echo $var3
}


test1
