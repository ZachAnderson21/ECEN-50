clear 
close all
clc

%define known variables 
Vs = 12;
Is1 = 4e-3;
Is2 = 2e-3;
R1 = 1e3;
R2 = 1e3;
R3 = 1e3;
R4 = 1e3;
R5 = 1e3;
R6 = 1e3;

%define 4 unknowns as symbols 
syms Va Vb Vc Vd;

%define 4 equations
eq1 = -Is1 + ((Va-Vb)/R1) + ((Vd-Vc)/R2) + (Vd/R5) + (Vd/(R3+R6)) == 0; 
eq2 = ((Vb-Va)/R1) + Is2 + (Vc/R4) + ((Vc-Vd)/R2) == 0;               
eq3 = Vc-Vb == Vs;
eq4 = Vd-Va == 2*Vc; 

%Group 4 equations
eqns = [eq1, eq2, eq3, eq4];

%Group the 4 Variables 
vars = [Va, Vb, Vc, Vd];

% Solve 
results = solve(eqns,vars);
Va = results.Va;
Vb = results.Vb;
Vc = results.Vc;
Vd = results.Vd;

%Convert Solved Results into double precision decimals
Va = double(Va);
Vb = double(Vb);
Vc = double(Vc);
Vd = double(Vd);

%Display Results 
disp('Va is equal to');
disp (Va);
disp('Vb is equal to');
disp (Vb);
disp('Vc is equal to');
disp (Vc);
disp('Vd is equal to');
disp (Vd);


