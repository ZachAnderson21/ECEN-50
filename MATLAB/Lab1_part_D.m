clear
close all 
clc

%define known variables 
Vs1 = 6;
Vs2 = 12;
Is1 = 2e-3;
Is2 = 4e-3;
Is3 = 6e-3;
R1 = 1e3;
R2 = 1e3;
R3 = 2e3;
R4 = 1e3;

%define 4 unknowns as symbols 
syms Va Vb Vc Vd;

%define 4 equations
eq1 = ((Va - Vb)/R1)-Is1+((Va-Vd)/R2)-Is3 == 0;
eq2 = ((Vb - Va)/R1) + Is1 + ((Vd-Va)/R2) + (Vb/R3) + Is2 + (Vd/R4) == 0;
eq3 = Vb - Vc == Vs1;
eq4 = Vd - Vc == Vs2;

%Group 4 equations
eqns = [eq1, eq2, eq3, eq4];

%Group the 4 Variables 
vars = [Va, Vb, Vc, Vd];

% Extract Matrixes
[C, S] = equationsToMatrix(eqns, vars); 

%Use rref to solve equations
CS = [C S];
R = rref(CS);
disp(R);

%Convert to double precision integrals 
sols = R(:, 5);
sols = double(sols);
disp(sols);




   