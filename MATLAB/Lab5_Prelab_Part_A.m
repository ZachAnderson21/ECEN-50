clear 
close all 
clc 

%Lab 5 - Prelab Part A 

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

% Load values from table 3, inclding 0 and inf
RL_values = [0, 0.15e3, 0.32e3, 0.73e3, 1.3e3, 2.0e3, 3.2e3, 5.0e3, 8.7e3, 19e3, 40e3, Inf];

% Allocate Arrays for VL and IL
VL = zeros(size(RL_values));
IL = zeros(size(RL_values));

% Set up the  variables for V2, V3, V5
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

% Find VL and IL for every RL
for i = 1:length(RL_values)
    RL = RL_values(i);
    if isinf(RL)
        VL(i) = V5_val;       
        IL(i) = 0;            
    elseif RL == 0
        VL(i) = 0;            
        IL(i) = V5_val / R8;  
    else
        VL(i) = V5_val * RL / (RL + R8); 
        IL(i) = VL(i) / RL;             
    end
end

% Grpah IL vs VL
figure;
plot(VL, IL, 'o-');
xlabel('Load Voltage V_L (V)');
ylabel('Load Current I_L (A)');
title('IL vs VL');
grid on;
