clear 
close all 
clc 

%Lab 5 - Prelab Part D

%Define known values
Voc = 5.8415;        
Rth = 3060.2964;     

% Calculate max power
Pmax = (Voc^2) / (4 * Rth);

% Display 
fprintf('The Max Power Transfer (Pmax) is %.4f W\n', Pmax);
