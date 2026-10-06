close all
clear all
clc

syms a2 d2 t1 t2 t3

a = [0, a2, 0];
alpha = sym([-pi/2, 0, 0]);
d = [0, d2, 0];
theta = sym([pi/4, 0, pi/2]);

fwdkin_Tsurutome(a, alpha, d, theta)