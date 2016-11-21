function xor

import brml.*

A=1; B=2; output = 3; % Variable order is arbitary
zero=1; one=2; % define states, starting from 1.

% The following definitions of variable are not necessary for computation,
% but are useful for displaying table entries:
variable(A).name='A'; variable(A).domain = {'zero','one'};
variable(B).name='B'; variable(B).domain = {'zero','one'};
variable(output).name='output'; variable(output).domain = {'zero','one'};


pot(A)=array;
pot(A).variables=A;
pot(A).table(zero)=0.35;
pot(A).table(one)=0.65;

pot(B)=array;
pot(B).variables=B;
pot(B).table(zero)=0.23;
pot(B).table(one)=0.77;

pot(output)=array;
pot(output).variables=[output,A,B]; % define array below using this variable order
pot(output).table(one, zero, zero)=0.10;  
pot(output).table(one, zero, one)   =0.99;
pot(output).table(one, one, zero)=0.80;
pot(output).table(one, one, one)   =0.25;
pot(output).table(zero,:,:)=1-pot(output).table(one,:,:); % due to normalisation

jointpot = multpots(pot); % joint distribution

drawNet(dag(pot),variable);

disp('p(A|output=0):')
disptable(condpot(setpot(jointpot,output,zero), A),variable);
