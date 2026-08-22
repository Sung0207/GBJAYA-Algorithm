function [Stat,BestValue,XTarget,pdm]=IJAYA(fhd,nPop,nVar,VarMin,VarMax,MaxIt,X)
% fhd,nPop,nVar,VarMin,VarMax,MaxIt,X
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
%Yu et al., 2017
%Parameters identification of photovoltaic models using an improved JAYA optimization algorithm
% Energy Conversion and Management
for i=1:nPop
%     X(i,:)=VarMin+rand(1,nVar).*(VarMax-VarMin); %Initial population
    f(i) = fhd(X(i,:));
end
gen=1;% Initial the number of iterations
[Best_Cost,ind]=min(f);% 
Div=dispersion(X);
Stat(gen,:)=[Best_Cost median(f) iqr(f) Div];
XTarget=X(ind,:);
Zm=rand(1,nVar);pdm=[];
for gen=1:MaxIt % Main loop
    [t,tindex]=sort(f);
    Best=X(tindex(1),:); 
    worst=X(tindex(end),:);
    xnew=zeros(nPop,nVar);
    w=f(tindex(1))/f(tindex(end));
    for ii=1:nPop;
        uF(tindex(ii))=ii/nPop;
    end
    if gen>1
        Zm=4*Zm.*(1-Zm);
    end
    for i=1:nPop
        if i==tindex(1)
            xnew(i,:)=X(i,:)+rand(1,nVar).*(2*Zm-1);
        else
            if rand<rand
                xnew(i,:)=X(i,:)+rand(1,nVar).*(Best-abs(X(i,:)))+w^2*rand(1,nVar).*(abs(X(i,:))-worst);
            else
                xnew(i,:)=LaerningStrategy(i,nPop,nVar,X,f);
            end
        end
    end
    for i=1:nPop
        xnew(i,:) = BC(xnew(i,:),VarMin,VarMax,nVar);% boundary limit
        fnew(i,:) = fhd(xnew(i,:));
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
    XTarget=X(ind,:);
end
BestValue=min(f);
end

function xnew=LaerningStrategy(i,nPop,nVar,X,f)
r1=randperm(nPop,1);
while r1==i
    r1=randperm(nPop,1);
end
r2=randperm(nPop,1);
while r2==i || r2==r1
    r2=randperm(nPop,1);
end
if f(r1)<f(r2)
  xnew=X(i,:)+rand(1,nVar).*(X(r1,:)-X(r2,:));
else
  xnew=X(i,:)+rand(1,nVar).*(X(r2,:)-X(r1,:));
end 
end
