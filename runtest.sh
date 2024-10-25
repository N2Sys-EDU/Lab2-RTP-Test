#!/bin/bash

if [ ! -f ".built" ]; then
    touch .built &&
        rm -rf build &&
        cp test/test.cpp src/ &&
        cmake -B build/ &&
        cd build/ &&
        make -j &&
        cd ..
fi

cd build
ls
cd ..
./build/rtp_test_all --gtest_filter="*.$1"
