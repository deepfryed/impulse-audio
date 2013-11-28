#!/usr/bin/env ruby

require 'mkmf'

$CFLAGS = '-std=c99'

find_library('pulse', 'main')
find_library('fftw3', 'main')

create_makefile 'impulse'
