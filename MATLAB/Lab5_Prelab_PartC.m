clear 
close all 
clc 

%Lab 5 - Prelab Part C

%Define known values  
R1 = 1e3;
R2 = 1.8e3;
R3 = 2.7e3;
R4 = 3e3;
R5 = 4.7e3;
R6 = 6.2e3;
R7 = 10e3;
R8 = 15e3;
R9 = 20e3;
Vs1 = 10;
Vs2 = 4;

% Set up the variables V2, V3
syms V2 V3

% KCL equations for nodes 2 and 3
eq1 = (V2 - Vs1)/R1 + (V2 - V3)/R3 + V2/R9 + (V2 - 0)/R5 == 0;
eq2 = (V3 - V2)/R3 + (V3 - Vs2)/R4 + V3/R6 + (V3 - 0)/R7 == 0;

% Solve for V2 and V3
solutions = solve([eq1, eq2], [V2, V3]);
V2_val = double(solutions.V2);
V3_val = double(solutions.V3);

% Isc using KCL at node 5
Isc = (V2_val - 0)/R5 + (V3_val - 0)/R7 + 0/R8;

% Find Rth
Vth = 5.8415; 
Rth = Vth / Isc;

% Display 
fprintf('The Short-Circuit current (Isc) is %.4f A\n', Isc);
fprintf('The Thevenin equivalent resistance (Rth) is %.4f Ohms\n', Rth);
