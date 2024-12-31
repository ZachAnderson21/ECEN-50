clear 
close all
clc 

%define functions 
syms x;

f = (exp(-3*x) + 10*sin(x+1))/(cos(x+1));
g = (exp(-2*x)/(1+exp(-2*x)));
h = (-4*x^2);

%derivatives of f and g 
Df1 = diff(f, x);
pretty(Df1)

Dg1 = diff(g, x);
pretty(Dg1);

%Integral of h between -2 and 2 
Int1 = int(h, x, -2, 2);
Int1 = double(Int1);
disp (Int1);

