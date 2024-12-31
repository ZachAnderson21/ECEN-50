clear
close all 
clc


%Lab 4 Prelab Part 2

%Define Given Values 

Radj = 10e3;
R1 = 1e3;
R2 = 4.3e3;
Vs = 10; 

%Find Rx 

Rx = (R2/R1) * Radj; %Find Rx using the defintion of balance wheatstone bridge

%Find the current 

Req1 = (Rx*Radj) / (Rx + Radj); %Resistance of Rx and Radj

Req2 = (R1 * R2) / (R1 + R2) ; %Resistance of Rx and Radj

R_Total = Req1 + Req2 ; %R total

Is = Vs / R_Total ; %The total Current Since V = IR

%Display Results in a Table

Table_B = table(R1, R2, Radj, Rx, Is, ...
    'VariableNames', {'R1', 'R2', 'Radj', 'Rx', 'Is'});

disp('Table B: Figure 3 Circuit Values');
disp(Table_B);
