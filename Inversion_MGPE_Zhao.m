clc
clear all;close all
global Mw X h delh delFr Ck Obs
% path = pwd;
% path11=strcat(path,filesep);
% addpath(strcat(pwd,filesep,'GOM'));
% addpath(strcat(pwd,filesep,'Data'));
% addpath(strcat(pwd,filesep,'SFs'));
Number=1;% the number of models
LoopIter=30;% the number of runs
MaxIt=200; % maximum iteration
%the maximum number of function evaluations
Objbest1=[];Objbest2=[];Objbest3=[];Objbest4=[];Objbest5=[];Objbest6=[];
    for i=1:LoopIter % start task
        [VarMin,VarMax,nVar,Obs,Mw,X,h,delh,delFr,Ck,M,nPop,fun]=m_Zhao(Number);%intilize parameters
         [Stat1,BestValue1,xgbest1,xpos1]=PSO(fun,nPop,nVar,VarMin,VarMax,MaxIt,M);
         All1(i).PDM=xpos1;
         All1(i).xgbest=xgbest1;
         All1(i).Stat=Stat1;
         Objbest1=[Objbest1 BestValue1];
         disp(['Iteration ' num2str(i) ': the optimal solution of PSO= ' num2str(BestValue1,15)]);
         [Stat2,BestValue2,xgbest2,xpos2]=GBJAYA(fun,nPop,nVar,VarMin,VarMax,MaxIt,M);
         All2(i).PDM=xpos2;
         All2(i).xgbest=xgbest2;
         All2(i).Stat=Stat2;
         Objbest2=[Objbest2 BestValue2];
         disp(['Iteration ' num2str(i) ': the optimal solution of GBJAYA= ' num2str(BestValue2,15)]);

         [Stat3,BestValue3,xgbest3,xpos3]=JAYA(fun,nPop,nVar,VarMin,VarMax,MaxIt,M);
         All3(i).PDM=xpos3;
         All3(i).xgbest=xgbest3;
         All3(i).Stat=Stat3;
         Objbest3=[Objbest3 BestValue3];
         disp(['Iteration ' num2str(i) ': the optimal solution of JAYA= ' num2str(BestValue3,15)]);

         [Stat4,BestValue4,xgbest4,xpos4]=CLJAYA(fun,nPop,nVar,VarMin,VarMax,MaxIt,M);
         All4(i).PDM=xpos4;
         All4(i).xgbest=xgbest4;
         All4(i).Stat=Stat4;
         Objbest4=[Objbest4 BestValue4];
         disp(['Iteration ' num2str(i) ': the optimal solution of CLJAYA= ' num2str(BestValue4,15)]);

         [Stat5,BestValue5,xgbest5,xpos5]=IJAYA(fun,nPop,nVar,VarMin,VarMax,MaxIt,M);
         All5(i).PDM=xpos5;
         All5(i).xgbest=xgbest5;
         All5(i).Stat=Stat5;
         Objbest5=[Objbest5 BestValue5];
         disp(['Iteration ' num2str(i) ': the optimal solution of IJAYA= ' num2str(BestValue5,15)]);
         disp(['======================================================================================='])
    end
    %%%%
    [~,jke]=min(Objbest1);
    MbestPSO=All1(jke).xgbest;
    preJ=GPApreZhao(MbestPSO);
    %%%%
    [~,Enjke]=min(Objbest2);
    Mbest=All2(Enjke).xgbest;
    prebest=GPApreZhao(Mbest);
subplot(2,1,1)
plot(Mw,log(10.^(preJ-Obs)),'rs','linewidth',1.5);
xlim([min(Mw) max(Mw)])
% ylim([-2 2])
hold on
plot(Mw,zeros(length(Mw),1),'k-','linewidth',2)
xlim([min(Mw) max(Mw)])
% ylim([-2 2])
ylabel('Residuals','fontsize',12,'fontweight','bold','fontname','Times')
xlabel('Mw','fontsize',12,'fontweight','bold','fontname','Times')
title('PSO','fontsize',12,'fontweight','bold','fontname','Times')

subplot(2,1,2)
plot(Mw,log(10.^(prebest-Obs)),'rs','linewidth',1.5);
xlim([min(Mw) max(Mw)])
% ylim([-2 2])
hold on
plot(Mw,zeros(length(Mw),1),'k-','linewidth',2)
xlim([min(Mw) max(Mw)])
% ylim([-2 2])
ylabel('Residuals','fontsize',12,'fontweight','bold','fontname','Times')
xlabel('Mw','fontsize',12,'fontweight','bold','fontname','Times')
title('GBJAYA','fontsize',12,'fontweight','bold','fontname','Times')
cd Hasil
save ZhaoPGA.mat
cd  ..