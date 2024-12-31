clear
clc 
close all 

%Part 2 - Impact of Ammeter (AM) with a “High” Internal Resistance

%Define the Given Values
Vs = 2;             
Rs = 100e3;         
Ram = 25;           

%Resistor Values for R2 in Ohms
R2_vals = [51, 100, 120, 160, 220]; % Resistors in Ohms

% Initialize Arrays to Store Results
i2_vals = zeros(1, length(R2_vals));    
i2L_vals = zeros(1, length(R2_vals));   
E2_vals = zeros(1, length(R2_vals));    
RamL_vals = zeros(1, length(R2_vals));  

%Looping through each R2 value
for i = 1:length(R2_vals)
    R2 = R2_vals(i);
    
    %Part A: Calculate i2 (Current through R2 without Ram)
    i2 = Vs / (Rs + R2) * 1e3;  
    i2_vals(i) = i2;
    
    %Part B: Calculate i2L (Current through R2 with Ram in series)
    i2L = Vs / (Rs + R2 + Ram) * 1e3; 
    i2L_vals(i) = i2L;
    
    %Part C: Calculate Percentage Error E2
    E2 = ((i2L - i2) / i2) * 100;
    E2_vals(i) = E2;
    
    %Part D: Calculate RamL for a known i2L
    RamL = (Vs / (i2L / 1e3)) - (Rs + R2);  
    RamL_vals(i) = RamL;
end

%Display the Results in a Table
results_table = table(R2_vals.', i2_vals.', i2L_vals.', E2_vals.', RamL_vals.', ...
    'VariableNames', {'R2 (Ohms)', 'i2 (mA)', 'i2L (mA)', 'E2 (%)', 'RamL (Ohms)'});

disp('Results:');
disp(results_table);
