function hamburguer

import brml.*

eater=1; sick=2; output = 3; % Variable order is arbitary
false=1; true=2; % define states, starting from 1.

% The following definitions of variable are not necessary for computation,
% but are useful for displaying table entries:
variable(eater).name='eater'; variable(eater).domain = {'false','true'};
variable(sick).name='sick'; variable(sick).domain = {'false','true'};

% Three potential since p(butler,maid,knife)=p(knife|butler,maid)p(butler)p(maid).
% potential numbering is arbitary

pot(eater)=array;
pot(eater).variables=[eater, sick];
% pot(eater).table(false)=0.5;
pot(eater).table(true)=0.5;
pot(eater).
pot(sick)=array;
pot(sick).variables=sick;
pot(sick).table(false)=1-(1/100000);
pot(sick).table(true)=1/100000;

pot(output)=array;
pot(output).variables=[output,eater,sick]; % define array below using this variable order
pot(output).table(true, false, false)=0.10;  
pot(output).table(true, false, true)   =0.99;
pot(output).table(true, true, false)=0.80;
pot(output).table(true, true, true)   =0.25;
pot(output).table(false,:,:)=1-pot(output).table(true,:,:); % due to normalisation

jointpot = multpots(pot); % joint distribution

drawNet(dag(pot),variable);
% disp('p(butler|knife=used):')
% disptable(condpot(setpot(jointpot,knife,used),butler),variable);
% disp('p(maid|knife=used):')
% disptable(condpot(setpot(jointpot,knife,used),maid),variable);
disp('p(eater=true|output=false):')
disptable(condpot(setpot(jointpot,eater,true), sick),variable);
