clear 
close all
clc

% Resistor values in kΩ
R1 = 1e3;  % 1 kΩ
R2 = 3e3;  % 3 kΩ
R3 = 3.3e3; % 3.3 kΩ
R4 = 4.7e3; % 4.7 kΩ
R5 = 18e3; % 18 kΩ
R6 = 15e3; % 15 kΩ

% Voltage source
Vs = 10;  % 10 Volts

%%Subsection A 

%Resistance of R2, R4, R6 in Parallel
R_eq_a = 1 / (1/R2 + 1/R4 + 1/R6);

%Find REQ By adding REQ to the other resistors in series
R_total_a = R_eq_a + R1 + R3 + R5;

%Present Data
disp('The total Resistance Seen by Vs in ohms is:');
disp(R_total_a);


%%Subsection B 

%Set up symbolic variables for node voltages and currents
syms V_A V_B I1 I2 I3 I4 I5

%Ground nodes C and D
V_C = 0;
V_D = 0;

%Find KCL at Node A: Junction of R1, R2, and R3
eqn1 = (Vs - V_A)/R1 == (V_A - V_C)/R2 + (V_A - V_B)/R3;

%Find KCL at Node B: Junction of R3, R4, and R5
eqn2 = (V_A - V_B)/R3 == (V_B - V_D)/R4 + (V_B - V_C)/R5;

%Solve the System of Equations for Node Voltages V_A and V_B
sol = solve([eqn1, eqn2], [V_A, V_B]);

%Extract Numerical Values for Node Voltages
V_A = double(sol.V_A);
V_B = double(sol.V_B);

%Calculate Currents Through each Resistor
I1 = (Vs - V_A) / R1;       
I2 = (V_A - V_C) / R2;      
I3 = (V_A - V_B) / R3;      
I4 = (V_B - V_D) / R4;      
I5 = (V_B - V_C) / R5; 
I6 = (V_A - V_B) / R6; 

%Voltages Across Each Resistor
V1 = I1 * R1;
V2 = I2 * R2;
V3 = I3 * R3;
V4 = I4 * R4;
V5 = I5 * R5;
V6 = I6 * R6;  

% Display the Theoretical Values
disp('Table for the Currents (Amps) and Voltages (Volts):');
T_values = table([I1; I2; I3; I4; I5; I6], [V1; V2; V3; V4; V5; V6], 'VariableNames', {'Current (Amps)', 'Voltage (Volts)'}, ...
                 'RowNames', {'R1', 'R2', 'R3', 'R4', 'R5', 'R6'});
disp(T_values);


%%Subsection C

%Sum of Currents at Node A 
KCL_A = I1 - (I2 + I3);

%Sum of Currents at Node B 
KCL_B = I3 - (I4 + I5);

%Display KCL Verification Results
disp('KCL Proof (Node A, Node B):');
disp(['KCL at Node A: ', num2str(KCL_A, '%.2f')]); 
disp(['KCL at Node B: ', num2str(KCL_B, '%.2f')]); 


%%Subsection D

% KVL for the Left Loop
KVL_left = Vs - V1 - V2;

% KVL for the Middle Loop
KVL_middle = V2 - V3 - V4;

%KVL for the Right Loop
KVL_right = V4 - V5;

%Display KVL Verification Results
disp('KVL Proof(Left, Middle, Right Loops):');
disp(['KVL Left Loop: ', num2str(KVL_left, '%.2f')]); 
disp(['KVL Middle Loop: ', num2str(KVL_middle, '%.2f')]);  
disp(['KVL Right Loop: ', num2str(KVL_right, '%.2f')]); 


