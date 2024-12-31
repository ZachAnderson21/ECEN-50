clear
clc
close all

%Lab 6 Prelab Part 2.2

%Define Givens
C1 = 1e-6; 
C2 = 2.2e-6; 
C3 = 4.7e-6; 
R1 = 0.5e3; 
R2 = 0.75e3;
Vs = 2;

% Time constant for each resistor-capacitor combination
t_R1_C1 = R1 * C1; 
t_R2_C1 = R2 * C1; 

%Display time constants
fprintf('Time constant with R1 and C1: %.2f s\n', t_R1_C1);
fprintf('Time constant with R2 and C1: %.2f s\n', t_R2_C1);
