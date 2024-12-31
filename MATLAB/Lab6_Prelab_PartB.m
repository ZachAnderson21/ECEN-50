clear
clc
close all

%Lab 6 Prelab Part 2.1

%Define Givens
C1 = 1e-6; 
C2 = 2.2e-6; 
C3 = 4.7e-6; 
R1 = 0.5e3; 
R2 = 0.75e3;
Vs = 2;

%Find Ceq
C_total = 1 / (1/C1 + 1/C2 + 1/C3);

% Voltage Across Each Capacitor using Series Divider Equations
V_C1 = Vs * (C_total / C1); 
V_C2 = Vs * (C_total / C2); 
V_C3 = Vs * (C_total / C3); 

%Display Voltage Across Each Capacitor
fprintf('Voltage across Capacitor 1: %.2f V\n', V_C1);
fprintf('Voltage across Capacitor 2: %.2f V\n', V_C2);
fprintf('Voltage across Capacitor 3: %.2f V\n', V_C3);
