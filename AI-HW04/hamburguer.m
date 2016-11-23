function hamburguer

import brml.*

h=1; kj=2; hkj = 3, kjh = 4; % Variable order is arbitary
false=1; true=2; % define states, starting from 1.

% The following definitions of variable are not necessary for computation,
% but are useful for displaying table entries:
variable(h).name='h'; variable(h).domain = {'false','true'};
variable(kj).name='kj'; variable(kj).domain = {'false','true'};
variable(hkj).name='hkj'; variable(hkj).domain = {'false','true'};
variable(kjh).name='kjh'; variable(kjh).domain = {'false','true'};

% Three potential since p(butler,maid,knife)=p(knife|butler,maid)p(butler)p(maid).
% potential numbering is arbitary

pot(h)=array;
pot(h).variables=[h];
pot(h).table(true)=0.5;
% pot(h).table(true)=0.001;
pot(h).table(false)=1-pot(h).table(true);

pot(hkj) = array;
pot(hkj).variables=[hkj];
pot(hkj).table(false)=0.1;
pot(hkj).table(true)=0.9;

pot(kj) = array;
pot(kj).variables=[hkj];
pot(kj).table(true)=1/100000;
pot(kj).table(false)=1-1/100000;


pot(kjh)=array;
pot(kjh).variables = [kj h];
pot(kjh).table(true,true) = pot(hkj).table(true)*pot(kj).table(true)/pot(h).table(true);
pot(kjh).table(false,true) = 1 - pot(kjh).table(true, true);
pot(kjh).table(true,false) = pot(hkj).table(false)*pot(kj).table(true)/pot(h).table(false); 
pot(kjh).table(false,false) = 1-pot(kjh).table(true,false);

jointpot = multpots(pot); % joint distribution

disp('p(kj|h=true):')
disptable(condpot(setpot(jointpot,h,true), kj),variable);
