function [PVP,TVP] = permu(Cond1, Cond2)

% permutation t-test analysis for between subjects analysis. By:
% Amirhossein Ghaderi, 
% Cond1, and Cond2 are column vectors of values in groups 1, 2
% PVP returns p-value and TVP returns t-value


Npermu=50000;
[h,p,t,stats]=ttest2(Cond1,Cond2);
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
[h1,p1,t1,stats1]=ttest2(a1,a2);
if p1<p
    count=count+1;
end
end
PVP=count/Npermu;
TVP=stats.tstat;
end

