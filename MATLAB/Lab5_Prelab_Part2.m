clear 
close all 
clc 

%Lab 5 - Prelab Part B

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

% Set up the variables V2, V3, V5
syms V2 V3 V5

% KCL equations for nodes 2, 3, and 5
eq1 = (V2 - Vs1)/R1 + (V2 - V3)/R3 + (V2 - V5)/R5 + V2/R9 == 0;
eq2 = (V3 - V2)/R3 + (V3 - Vs2)/R4 + (V3 - V5)/R7 + V3/R6 == 0;
eq3 = (V5 - V2)/R5 + (V5 - V3)/R7 + V5/R8 == 0;

% Solve for V2, V3, V5
solutions = solve([eq1, eq2, eq3], [V2, V3, V5]);
V2_val = double(solutions.V2);
V3_val = double(solutions.V3);
V5_val = double(solutions.V5);

% Thevenin equivalent voltage Vth
Vth = V5_val;

% Display 
fprintf('The Thevenin Voltage (Vth) is %.4f V\n', Vth);


