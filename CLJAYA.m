function [Stat,BestValue,XTarget,pdm]=CLJAYA(fhd,nPop,nVar,VarMin,VarMax,MaxIt,X)
%%Input parameters
%%fhd----------------objective function
%%nPop---------------population size 
%%nVar---------------the number of variables
%%VarMin-------------the lower boundaries of variables
%%VarMin-------------the upper boundaries of variables
%%MaxIt--------------the maximum number of iterations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Output parameters
%%BestCost-----------convergence curve
%%BestValue----------the optimal fitness value
%%XTarget------------the optimal solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Zhang and JIn, 2022
%Comprehensive learning Jaya algorithm for engineering design optimization problems
%Journal of Intelligent Manufacturing
% for i=1:nPop
%    X(i,:)=VarMin+(VarMax-VarMin).*rand(1,nVar); 
% end
for i=1:nPop
    f(i) = fhd(X(i,:));
end

%%  Main Loop
gen=1;
[Best_Cost,ind]=min(f);
Div=dispersion(X);
Stat(gen,:)=[Best_Cost median(f) iqr(f) Div];
XTarget=X(ind,:);pdm=[];
for gen=1:MaxIt
    [row,col]=size(X);
    [t,tindex]=min(f);
    Best=X(tindex,:);
    [w,windex]=max(f);
    worst=X(windex,:);
    xnew=zeros(row,col);
    xnew=CLJayamove(nPop,nVar,Best,worst,X);
    for i=1:row
        xnew(i,:)= BC(xnew(i,:),VarMin,VarMax,nVar);
        fnew(i) = fhd(xnew(i,:));
    end
    
    for i=1:nPop
        if(fnew(i)<f(i))
            X(i,:) = xnew(i,:);
            f(i) = fnew(i);
            pdm=[pdm;X(i,:) f(i)];
        end
    end
    gen = gen+1;
    [Best_Cost,ind]=min(f);
    Div=dispersion(X);
    Stat(gen,:)=[Best_Cost median(f) iqr(f) Div];
end
BestValue=min(f);
%%
 XTarget=X(ind,:);
end
