function dice

import brml.*

D1=1; D2=2; sum = 3; % Variable order is arbitary
one = 1; two = 2; three = 3; four = 4; five = 5; six = 6; seven = 7; eight = 8; nine = 9; ten = 10; eleven = 11; twelve = 12; % define states, starting from 1.

% The following definitions of variable are not necessary for computation,
% but are useful for displaying table entries:
variable(D1).name='D1'; variable(D1).domain = {'one','two', 'three', 'four', 'five', 'six'};
variable(D2).name='D2'; variable(D2).domain = {'one','two', 'three', 'four', 'five', 'six'};
variable(sum).name='sum'; variable(sum).domain={'one','two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve'};

% Three potential since p(butler,maid,knife)=p(knife|butler,maid)p(butler)p(maid).
% potential numbering is arbitary

pot(D1)=array;
pot(D1).variables=D1;
pot(D1).table(one)=1/6;
pot(D1).table(two)=1/6;
pot(D1).table(three)=1/6;
pot(D1).table(four)=1/6;
pot(D1).table(five)=1/6;
pot(D1).table(six)=1/6;

pot(D2)=array;
pot(D2).variables=D2;
pot(D2).table(one)=1/6;
pot(D2).table(two)=1/6;
pot(D2).table(three)=1/6;
pot(D2).table(four)=1/6;
pot(D2).table(five)=1/6;
pot(D2).table(six)=1/6;

pot(sum)=array;
pot(sum).variables=[sum,D1,D2]; % define array below using this variable order
for i = 1:12
    for j = 1:6
        for k = 1:6
            if i == j+k
                pot(sum).table(i,j,k) = 1;
            else pot(sum).table(i,j,k) = 0;
            end
        end
    end
end

jointpot = multpots(pot); % joint distribution

disp('p(D1,D2|sum=9):')
disptable(condpot(setpot(jointpot,sum,nine),[D1 D2]),variable);