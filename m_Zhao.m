function [VarMin,VarMax,nVar,Obs,Mw,X,h,delh,delFr,Ck,M,nPop,fun] = m_Zhao(func_flag)
switch func_flag
  case 1
      % Zhao
        amin=0;amax=3;bmin=-2;bmax=0;
        cmin=-2;cmax=2;dmin=0;dmax=1;
        emin=-1; emax=1;Frmin=-2;Frmax=2;
        VarMin = [amin bmin cmin dmin emin Frmin];
        VarMax = [amax bmax cmax dmax emax Frmax];
        nVar =length(VarMin);
        nPop=10*nVar;
        mobs1=xlsread('Zhao06.xlsx',1); % 
        Mw=mobs1(:,7);X=mobs1(:,14);h=mobs1(:,8);delh=mobs1(:,15);
        delFr=mobs1(:,16);Ck=mobs1(:,17);
        Obs=mobs1(:,20);
    case 2
        amin=0;amax=3;bmin=-2;bmax=0;
        cmin=-2;cmax=2;dmin=0;dmax=1;
        emin=-1; emax=1;Frmin=-2;Frmax=2;
        VarMin = [amin bmin cmin dmin emin Frmin];
        VarMax = [amax bmax cmax dmax emax Frmax];
        nVar =length(VarMin);
        nPop=10*nVar;
        mobs1=xlsread('Zhao06.xlsx',2); % 
        Mw=mobs1(:,7);X=mobs1(:,14);h=mobs1(:,8);delh=mobs1(:,15);
        delFr=mobs1(:,16);Ck=mobs1(:,17);
        Obs=mobs1(:,20);
    case 3
        amin=0;amax=3;bmin=-2;bmax=0;
        cmin=-2;cmax=2;dmin=0;dmax=1;
        emin=-1; emax=1;Frmin=-2;Frmax=2;
        VarMin = [amin bmin cmin dmin emin Frmin];
        VarMax = [amax bmax cmax dmax emax Frmax];
        nVar =length(VarMin);
        nPop=10*nVar;
        mobs1=xlsread('Zhao06.xlsx',3); % 
        Mw=mobs1(:,7);X=mobs1(:,14);h=mobs1(:,8);delh=mobs1(:,15);
        delFr=mobs1(:,16);Ck=mobs1(:,17);
        Obs=mobs1(:,20);
    case 4
        amin=0;amax=3;bmin=-2;bmax=0;
        cmin=-2;cmax=2;dmin=0;dmax=1;
        emin=-1; emax=1;Frmin=-2;Frmax=2;
        VarMin = [amin bmin cmin dmin emin Frmin];
        VarMax = [amax bmax cmax dmax emax Frmax];
        nVar =length(VarMin);
        nPop=10*nVar;
        mobs1=xlsread('Zhao06.xlsx',4); % 
        Mw=mobs1(:,7);X=mobs1(:,14);h=mobs1(:,8);delh=mobs1(:,15);
        delFr=mobs1(:,16);Ck=mobs1(:,17);
        Obs=mobs1(:,20);
end
for i=1:nPop
    M(i,:)=VarMin+rand(1,nVar).*(VarMax-VarMin);
end
fun=@fGMPE;
end





