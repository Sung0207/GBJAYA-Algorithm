function xnew=CLJayamove(nPop,nVar,Best,worst,X)
    for i=1:nPop
        a=randperm(nPop,1);
        b=randperm(nPop,1);
        while a==b || a==i ||b==i
            a=randperm(nPop,1);
            b=randperm(nPop,1);
        end
        fi=rand;
        if fi<=1/3
            xnew(i,:)=(X(i,:))+randn.*(Best-abs(X(i,:)))-randn.*(worst-abs(X(i,:)));  %
        elseif fi>=2/3
            xnew(i,:)=X(i,:)+rand(1,nVar).*(Best-(X(i,:)))+rand(1,nVar).*(X(a,:)-X(b,:));
        else
            xnew(i,:)=(X(i,:))+randn.*(Best-abs(X(i,:)))-randn.*(mean(X)-abs(X(i,:)));
        end
    end