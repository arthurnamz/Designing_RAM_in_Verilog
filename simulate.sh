#!/bin/sh

xvlog *.v
xelab testbench -timescale 1ns/1ps
xsim testbench -R 
