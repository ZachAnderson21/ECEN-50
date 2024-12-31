clear
close all 
clc



%Lab 4 Prelab - Part 1 

% Define the Given Values
R1 = 1e3;    
R2 = 4.3e3;  
R3 = 10e3;   
R4 = 12e3;   
R5 = 15e3;   
R6 = 18e3;  
Vs = 12;     

%Part A - Calculate the voltages 𝑣4 and 𝑣5 in Figure 1

Req1 = (R3 * R4) / (R3 + R4);  % They are in parallel 

Req2 = (Req1)*(R2+R5) / (Req1 + R2 + R5); %In R2 and R5 in series but result in parallel with Req1

V4 = ((Req2) / (R1 + Req2 + R6)) * Vs; %find V4 using voltage 

V5 = ((R5/ R2 + R5)) * V4; %find V5 using voltage division 


%Part b - Calculate the currents going through R4 and R5 (𝐼𝑅4 and 𝐼𝑅5 ) in Figure 1.

R_total = Req2 + R1 + R6; %Total Resitance

I_total = Vs / R_total; %Total Current

V_parallel = I_total * (Req2);  % Voltage 

IR4 = V_parallel / R4; %Resistance Across R4

IR5 = V_parallel / R5; %Resistance Across R4

%Part C - Calculate the dissipated power in R4 and R5 (𝑃𝑅4 and 𝑃𝑅5 ) in Figure 1

P_R4 = V_parallel * IR4;  % Power in R4

P_R5 = V_parallel * IR5;  % Power in R5

% Display results in a table format
Table_A = table(V_parallel, V_parallel, IR4 * 1e3, IR5 * 1e3, P_R4 * 1e3, P_R5 * 1e3, ...
    'VariableNames', {'v4_V', 'v5_V', 'IR4_mA', 'IR5_mA', 'PR4_mW', 'PR5_mW'});

% Display the table
disp('Table A: Figure 1 Circuit Values');
disp(Table_A);
