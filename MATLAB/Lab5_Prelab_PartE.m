clear 
close all 
clc 

%Lab 5 - Prelab Part E

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
Rth = 3060.2964; 
Voc = 5.8415;    

% Set R_L to Rth for maximum power transfer
RL = Rth;

% Solve for V2, V3, V5 using nodal analysis
C1 = 1/R1; C2 = 1/R2; C3 = 1/R3; %defining condutances
C4 = 1/R4; C5 = 1/R5; C6 = 1/R6;
C7 = 1/R7; C8 = 1/R8; C9 = 1/R9;

% Form the nodal equations at nodes 2, 3, and 5
% The matrix equation is [A]*[V2; V3; V5] = [B]
A = [C1 + C2 + C5, -C2, -C5;
    -C2, C2 + C3 + C4 + C6 + C7, -C7;
    -C5, -C7, C5 + C7 + C8 + 1/RL];

B = [C1*Vs1; C4*Vs2; 0];

% Solve for V2, V3, and V5
V = A\B;
V2 = V(1);
V3 = V(2);
V5 = V(3);

% Calculate power absorbed R_L
P_RL = V5^2 / RL;

% Calculate source currents Is1 and Is2
Is1 = (Vs1 - V2) / R1;
Is2 = (Vs2 - V3) / R4;

% Calculate power delivered to s1 and s2
P_S1 = Vs1 * Is1;
P_S2 = Vs2 * Is2;
P_total = P_S1 + P_S2;

%Find Ratio
Ratio = P_RL / P_total;

% Display results
fprintf('Power absorbed by R_L (P_RL): %.4f W\n', P_RL);
fprintf('Total power delivered by sources (P_total): %.4f W\n', P_total);
fprintf('Ratio of P_RL to P_total: %.4f\n', Ratio);

% Explanation
fprintf('The ratio is less than 50%% because power is dissipitated in other places throughout the circuit.\n');
