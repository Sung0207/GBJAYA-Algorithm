function [VarMin,VarMax,nVar,Obs,Mw,Vs30,R,En,Er,Es,M,nPop,fun] = m_bindi(func_flag)
switch func_flag
  case 1
      % bindi
        e1min=-3;e1max=6;c1min=-3;c1max=0;
        c2min=0;c2max=1;c3min=0;c3max=1;
        hmin=0; hmax=5;b1min=0;b1max=1;
        b2min=-1;b2max=0.00001;b3min=0;b3max=1;
        gammamin=-1;gammamax=-0.1;Frmin=0;Frmax=3;
        Fnmin=-3;Fnmax=3;Fsmin=-3;Fsmax=3;
        VarMin = [e1min c1min c2min hmin c3min b1min b2min b3min gammamin Frmin Fnmin Fsmin];
        VarMax = [e1max c1max c2max hmax c3max b1max b2max b3max gammamax Frmax Fnmax Fsmax];
        nVar =length(VarMin);
        nPop=10*nVar;
        mobs1=xlsread('Bindi.xlsx',1); % 
        Mw=mobs1(:,7);Vs30=mobs1(:,11);
        R=mobs1(:,13);En=mobs1(:,14);Er=mobs1(:,15);Es=mobs1(:,16);
        Obs=mobs1(:,21);
    case 2
        e1min=-3;e1max=6;c1min=-3;c1max=0;
        c2min=0;c2max=1;c3min=0;c3max=1;
        hmin=0; hmax=5;b1min=0;b1max=1;
        b2min=-1;b2max=0.00001;b3min=0;b3max=1;
        gammamin=-1;gammamax=-0.1;Frmin=0;Frmax=3;
        Fnmin=-3;Fnmax=3;Fsmin=-3;Fsmax=3;
        VarMin = [e1min c1min c2min hmin c3min b1min b2min b3min gammamin Frmin Fnmin Fsmin];
        VarMax = [e1max c1max c2max hmax c3max b1max b2max b3max gammamax Frmax Fnmax Fsmax];
        nVar =length(VarMin);
        nPop=10*nVar;
        mobs1=xlsread('Bindi.xlsx',2); % 
        Mw=mobs1(:,7);Vs30=mobs1(:,11);
        R=mobs1(:,13);En=mobs1(:,14);Er=mobs1(:,15);Es=mobs1(:,16);
        Obs=mobs1(:,21);

    case 3
        e1min=-3;e1max=6;c1min=-3;c1max=0;
        c2min=0;c2max=1;c3min=0;c3max=1;
        hmin=0; hmax=5;b1min=0;b1max=1;
        b2min=-1;b2max=0.00001;b3min=0;b3max=1;
        gammamin=-1;gammamax=-0.1;Frmin=0;Frmax=3;
        Fnmin=-3;Fnmax=3;Fsmin=-3;Fsmax=3;
        VarMin = [e1min c1min c2min hmin c3min b1min b2min b3min gammamin Frmin Fnmin Fsmin];
        VarMax = [e1max c1max c2max hmax c3max b1max b2max b3max gammamax Frmax Fnmax Fsmax];
        nVar =length(VarMin);
        nPop=10*nVar;
        mobs1=xlsread('Bindi.xlsx',3); % 
        Mw=mobs1(:,7);Vs30=mobs1(:,11);
        R=mobs1(:,13);En=mobs1(:,14);Er=mobs1(:,15);Es=mobs1(:,16);
        Obs=mobs1(:,21);

    case 4
        e1min=-3;e1max=6;c1min=-3;c1max=0;
        c2min=0;c2max=1;c3min=0;c3max=1;
        hmin=0; hmax=5;b1min=0;b1max=1;
        b2min=-1;b2max=0.00001;b3min=0;b3max=1;
        gammamin=-1;gammamax=-0.1;Frmin=0;Frmax=3;
        Fnmin=-3;Fnmax=3;Fsmin=-3;Fsmax=3;
        VarMin = [e1min c1min c2min hmin c3min b1min b2min b3min gammamin Frmin Fnmin Fsmin];
        VarMax = [e1max c1max c2max hmax c3max b1max b2max b3max gammamax Frmax Fnmax Fsmax];
        nVar =length(VarMin);
        nPop=10*nVar;
        mobs1=xlsread('Bindi.xlsx',4); % 
        Mw=mobs1(:,7);Vs30=mobs1(:,11);
        R=mobs1(:,13);En=mobs1(:,14);Er=mobs1(:,15);Es=mobs1(:,16);
        Obs=mobs1(:,21);
end
for i=1:nPop
    M(i,:)=VarMin+rand(1,nVar).*(VarMax-VarMin);
end
fun=@fGMPE;
end





