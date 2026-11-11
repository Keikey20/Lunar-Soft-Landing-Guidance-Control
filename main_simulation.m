clc;
clear;
close all;

%%run the presim file
run presim.m
%%Integrate rk method
tic
[t,state,others] =rk4_method(@Differential_Eq,t0,X0,time,paramat);
%% run data storage
run datastorage.m
%%plotting
run plotting.m
delete *.asv       