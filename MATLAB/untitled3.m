% ECEN 50L Lab 3 prelab part 2
% Impact of ammeter with low internal resistance
%% clear workspace, command window; enter first data
clc
clear
close all
% define circuit elements
Vs = 2; % source voltage
Rs = 100; % pre-determined Rs
Ram = 25; % ammeter internal resistance
R2 = [50.15; 98.617; 118.52; 158.56; 217.86]; % choose 5 values of the load R2
% We use a column vector to conveniently represent all 5 values of R2
% use element-by-element multiplication and division of column vectors
%% Part 2 calculations
% part a: calculate i2 when ammeter is ideal, Ram is not included
i2 = Vs./(Rs + R2)*1000; % i2 is a column vector, in mA
% part b: calculate i2L when ammeter is not ideal, Ram is connected
R2L = R2 + Ram;
% find i2L by using Ohm's law
i2L = Vs./(Rs + R2L)*1000; % i2L is a column vector, in mA
% part c: calculate the percentage error
E2 =(i2L - i2)./i2*100; % E2 is a column vector, in percent
% partd: calculate Ram based on i2L
RamL = 1e3*Vs./i2L - Rs - R2; % note i2L is in mA
% create a table to summarize the results
table_B = table (R2, i2, i2L, E2, RamL);
% display results
disp(['Prelab part B, ammeter resistance Ram = ',num2str(Ram),' Ohm'])
disp('Table B: prelab part 2 results')
disp(table_B)
