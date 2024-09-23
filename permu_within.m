function [PVP,TVP] = permu(Cond1, Cond2, Npermu)

% permutation t-test analysis for between subjects analysis. By:
% Amirhossein Ghaderi, 
% Cond1, and Cond2 are column vectors of values in group 1, 2. The lenght
% of two vectors should be same.
% Npermu is the number of random shuffles
% PVP returns p-value and TVP returns t-value


[h,p,t,stats]=ttest(Cond1,Cond2);
a1=Cond1;
a2=Cond2;
count=0;
for i=1:Npermu
Tot=[a1;a2];
[m,n]=size(Tot);
idx=randperm(m);
TotPerm=Tot;
TotPerm(idx,1) = Tot(:,1);
a1=TotPerm(1:(m/2));
a2=TotPerm((m/2)+1:m);
[h1,p1(i),t1,stats1]=ttest(a1,a2);
t_(i)=stats1.tstat;
if p1(i)<p
    count=count+1;
end
end
histogram(t_)
PVP=count/Npermu;
TVP=stats.tstat;
end

