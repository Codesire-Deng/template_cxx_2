#!/bin/bash

clang-format -i `find include/ -type f -name *.hpp`
clang-format -i `find lib/ src/ test/ -type f -name *.cpp`

cloc --git `git branch --show-current`
