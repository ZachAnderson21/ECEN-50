clear
clc 
close all 

%Part 1 - Impact of Voltmeter (VM) with a non-ideal, “Low” Internal Resistance

%Define the Given Values 
Vs = 5;            
Rs = 100e3;        
Rvm = 5e6;         

%Resistor Values for R1 in Ohms
R1_vals = [27e3, 33e3, 56e3, 100e3, 82e3]; 

%Initialize Arrays to Store Results
v1_vals = zeros(1, length(R1_vals));
v1L_vals = zeros(1, length(R1_vals));
E1_vals = zeros(1, length(R1_vals));
RvmL_vals = zeros(1, length(R1_vals));

%Looping through each R1 value
for i = 1:length(R1_vals)
    R1 = R1_vals(i);
    
    %Part A: Calculate v1 (Rvm is not Connected)
    v1 = Vs * (R1 / (Rs + R1));
    v1_vals(i) = v1;
    
    %Part B: Calculate v1L (Rvm is Connected in Parallel)
    Req = (R1 * Rvm) / (R1 + Rvm);  
    v1L = Vs * (Req / (Rs + Req));  
    v1L_vals(i) = v1L;
    
    %Part C: Calculate the Percentage Error
    E1 = ((v1L - v1) / v1) * 100;
    E1_vals(i) = E1;
    
    %Part D: Calculate RvmL for a Known v1L
    RvmL = (v1L * R1 * Rvm) / (v1 * (Rvm - v1L * R1));
    RvmL_vals(i) = RvmL;
end

%Display Results in a Table
results_table = table(R1_vals.', v1_vals.', v1L_vals.', E1_vals.', RvmL_vals.', ...
    'VariableNames', {'R1 (Ohms)', 'v1 (V)', 'v1L (V)', 'E1 (%)', 'RvmL (Ohms)'});

disp('Results:');
disp(results_table);

