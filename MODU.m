function [Md]=MODU(NChannels,subnetarray,ITER1,ITER2,A)

% Newman modularity analysis for brain networks
%   By Amir Hossein Ghaderi
% Inputs: 
%   'NChannels' is number of electrodes/brain regions, 'subnetarray'
%   is a column vector that identify the index of subnetwork regions in adjacancy matrix
%   'ITER1', 'ITER2' are number of randomazation
%   'A' is adjacency matrix
% Output: 
%   'Md' is level of modularity in subnetwork 
%   (Modular subnetwork: Md>1 and Md=<1 non-modular subnetwork)

temp=A;
temparray=nonzeros(temp);
[m,n]=size(temparray);
TotPerm=temparray;
Mo=zeros(ITER2,1);

SubROriginal=A(subnetarray,subnetarray);
AveEdgeO=mean(mean(SubROriginal));
OriginalEdgeMean=mean(AveEdgeO);

for ll=1:ITER2       
        for ii=1:ITER1
            idx=randperm(m);
            TotPerm(idx,1) = temparray(:,1);
            temparray_shaffeled=TotPerm(1:m);
       
            lcount=1;
            for i=1:NChannels
                for j=i+1:NChannels
                    temp_shaffeled(i,j)=temparray_shaffeled(lcount);
                    lcount=lcount+1;
                end
            end
            temp_shaffeled(NChannels,:)=0;
            RandomPre(:,:,ii)=temp_shaffeled+temp_shaffeled';
            SubRandomPre=RandomPre(subnetarray,subnetarray);
            AveEdge(ii)=mean(mean(SubRandomPre));
        end
    
        RandomEdgeMean=mean(AveEdge);

        Mo(ll,1)=OriginalEdgeMean/RandomEdgeMean;
    end
    Md=mean(Mo,1);
end