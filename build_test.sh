#!/bin/sh

export RBXOPT=-X19

for ruby in \
 1.8.7-p358\
 1.9.2-p290\
 1.9.3-p194\
 jruby-1.6.7\
 rbx-1.2.4\
 rbx-2.0.0-dev\
 ree-1.8.7-2012.02
do
    echo "\n********************************************************************************"
    echo "Building $ruby\n"
    cd ext/ox
    rbenv local $ruby
    ruby extconf.rb
    make clean
    make

    echo "\nRunning tests for $ruby"
    cd ../../test
    rbenv local $ruby
    ./tests.rb
    ./sax_test.rb
    cd ..

    echo "\n"
done
