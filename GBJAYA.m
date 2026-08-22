function [Stat,BestValue,XTarget,pdm]=GBJAYA(fhd,n,nVar,VarMin,VarMax,t,x)
%obj--------objective function
%c-------population size
%d-------dimension of problem
%lb-----the lower limit of the variables
%ub-----the upper limit of the variables
%t------the maximum number of function evaluations
%cgcurve---the record of the convergence curves
%bestobj--the optimal fitness value
%bestsol-------the optimal solution
% Initialise the population
for i=1:n
%     X(i,:)=VarMin+rand(1,nVar).*(VarMax-VarMin); %Initial population
    f(i) = fhd(x(i,:));
end
gen=1;% Initial the number of iterations
[Best_Cost,ind]=min(f);%
Div=dispersion(x);
Stat(gen,:)=[Best_Cost median(f) iqr(f) Div];
XTarget=x(ind,:);pdm=[];
for gen=1: t
    [ct,tindex]=sort(f);
    Best=x(tindex(1),:); 
    M= mean(x);
    worst=x(tindex(end),:);
    for ii=1:n;
        uF(tindex(ii))=ii/n;
    end
    w=f(tindex(1))/f(tindex(end));
    for i=1:n
        a=randperm(n,1);
        while a==i
            a=randperm(n,1);
        end
        b=randperm(n,1);
        while b==i ||a==b
            b=randperm(n,1);
        end
        % [F1,F2]=Ffactor(i,a,uF);
        if rand<=uF(i)
            newsol(i,:) =x(i,:)+rand(1,nVar).*(Best-abs(x(i,:)))+w^2*rand(1,nVar).*(abs(x(i,:))-worst);
        else
            newsol(i,:)=GB(i,a,b,Best,x,nVar);
        end
    end
    for i=1:n
        newsol(i,:) = BC(newsol(i,:),VarMin,VarMax,nVar);% boundary limit
        fnew(i,:) = fhd(newsol(i,:));
    end
    for i=1:n
        if(fnew(i)<f(i))
            x(i,:) = newsol(i,:);
            f(i) = fnew(i);
            pdm=[pdm;x(i,:) f(i)];
        end
    end
    [Best_Cost,ind]=min(f);
    Div=dispersion(x);
    Stat(gen+1,:)=[Best_Cost median(f) iqr(f) Div];
    XTarget=x(ind,:);
end
BestValue=min(f);
end

function X=Randn(Xbest,x,nvar)
meang=(Xbest+x)/2;
stdg=abs(Xbest-x);
X=meang+randn(1,nvar).*stdg;
end
function newsol=GB(i,a,b,Best,x,nVar)
if rand<0.5
    newsol=Randn(Best,x(i,:),nVar);
else 
    newsol=Best+rand(1,nVar).*(x(a,:)-x(b,:));
end
end

