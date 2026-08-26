clear all;clc;close all
% path = pwd;
% path11=strcat(path,filesep);
% addpath(strcat(pwd,filesep,'Hasil'));
% addpath(strcat(pwd,filesep,'GOM'));
% addpath(strcat(pwd,filesep,'Data'));
% addpath(strcat(pwd,filesep,'Hasil'));
Nrun=30;
load(['bindiPGA.mat'])
% cuk
for ii=1:Nrun    
     [Obj_best1(:,ii),Obj_med1(:,ii),Obj_Iqr1(:,ii),Swarm_Pot1(:,ii)]=isi1(All1,ii);
     [Obj_best2(:,ii),Obj_med2(:,ii),Obj_Iqr2(:,ii),Swarm_Pot2(:,ii)]=isi1(All2,ii);
     [Obj_best3(:,ii),Obj_med3(:,ii),Obj_Iqr3(:,ii),Swarm_Pot3(:,ii)]=isi1(All3,ii);
     [Obj_best4(:,ii),Obj_med4(:,ii),Obj_Iqr4(:,ii),Swarm_Pot4(:,ii)]=isi1(All4,ii);
     [Obj_best5(:,ii),Obj_med5(:,ii),Obj_Iqr5(:,ii),Swarm_Pot5(:,ii)]=isi1(All5,ii);
     % [Obj_best6(:,ii),Obj_med6(:,ii),Obj_Iqr6(:,ii),Swarm_Pot6(:,ii)]=isi1(All6,ii);
end
% 
last1=Obj_best1(end,:);last2=Obj_best2(end,:);
last3=Obj_best3(end,:);last4=Obj_best4(end,:);
last5=Obj_best5(end,:);%last6=Obj_best6(end,:);

[RMSE2,iter2]=min(last2);
% figure(3)


% cuk
[p1,h1] = signrank(last1,last2);
[p3,h3] = signrank(last3,last2);
[p4,h4] = signrank(last4,last2);
[p5,h5] = signrank(last5,last2);
% [p6,h6] = signrank(last6,last2);

has1=[max(last1) median(last1) min(last1) iqr(last1)];
has2=[max(last2) median(last2) min(last2) iqr(last2)];
has3=[max(last3) median(last3) min(last3) iqr(last3)];
has4=[max(last4) median(last4) min(last4) iqr(last4)];
has5=[max(last5) median(last5) min(last5) iqr(last5)];
% has6=[max(last6) median(last6) min(last6) iqr(last6)];
P=[p1 p3 p4 p5]';

Hasil=[has2;has1;has3;has4;has5]
figure(1)
% subplot(2,1,1)
plot(0:MaxIt,median(Obj_best1'),'r-','linewidth',1.5)
hold on
plot(0:MaxIt,median(Obj_best2'),'g--','linewidth',1.5)
plot(0:MaxIt,median(Obj_best3'),'b-','linewidth',1.5)
plot(0:MaxIt,median(Obj_best4'),'c:','linewidth',1.5)
plot(0:MaxIt,median(Obj_best5'),'m.','linewidth',1.5)
ylabel('Median of RMSE','fontsize',12,'fontweight','bold','fontname','Times')
xlabel('Iterations','fontsize',12,'fontweight','bold','fontname','Times')
% title('(a)','fontsize',12,'fontweight','bold','fontname','Times')
legend('PSO','EnJAYA','JAYA','CLJAYA','IJAYA')
xlim([0 200])
ylabel('Median of RMSE','fontsize',12,'fontweight','bold','fontname','Times')
xlabel('Iterations','fontsize',12,'fontweight','bold','fontname','Times')
title('(a)','fontsize',12,'fontweight','bold','fontname','Times')



d1=median(Swarm_Pot1');
d2=median(Swarm_Pot2');
d3=median(Swarm_Pot3');
d4=median(Swarm_Pot4');
d5=median(Swarm_Pot5');
d6=median(Swarm_Pot6');


figure(2)
% subplot(2,1,1)
plot(0:MaxIt,d1*100./max(d1),'r-','linewidth',1.5)
hold on
plot(0:MaxIt,d2*100./max(d2),'g--','linewidth',1.5)
plot(0:MaxIt,d3*100./max(d3),'b-','linewidth',1.5)
plot(0:MaxIt,d4*100./max(d4),'c:','linewidth',1.5)
plot(0:MaxIt,d5*100./max(d5),'m.','linewidth',1.5)
ylabel('Exploration(%)','fontsize',12,'fontweight','bold','fontname','Times')
xlabel('Iterations','fontsize',12,'fontweight','bold','fontname','Times')
title('(a)','fontsize',12,'fontweight','bold','fontname','Times')
legend('PSO','GBJAYA','JAYA','CLJAYA','IJAYA')
xlim([0 200])
Obj_best_f1=Obj_best1(end,:);Obj_best_f1n=Obj_best1n(end,:);
Obj_best_f2=Obj_best2(end,:);Obj_best_f2n=Obj_best2n(end,:);
Obj_best_f3=Obj_best3(end,:);Obj_best_f3n=Obj_best3n(end,:);
Obj_best_f4=Obj_best4(end,:);Obj_best_f4n=Obj_best4n(end,:);
Obj_best_f5=Obj_best5(end,:);Obj_best_f5n=Obj_best5n(end,:);
Obj_best_f6=Obj_best5(end,:);Obj_best_f6n=Obj_best5n(end,:);

y1=[Obj_best_f1;Obj_best_f2;Obj_best_f3;Obj_best_f4;Obj_best_f5;Obj_best_f6]';
y2=[Obj_best_f1n;Obj_best_f2n;Obj_best_f3n;Obj_best_f4n;Obj_best_f5n;Obj_best_f6n]';
Origin={'JAYA','MJAYA','CLJAYA','IJAYA','EJAYA','ECJAYA'};
% y1=log10(y1);
figure;
subplot(2,1,1)
boxplot(y1,'notch','on','Labels',Origin,'Widths',0.3)
ylabel('RMSE','fontsize',12,'fontweight','bold','fontname','Times')
title('(a)','fontsize',12,'fontweight','bold','fontname','Times')

% y1n=[]';
subplot(2,1,2)
boxplot(y2,'notch','on','Labels',Origin,'Widths',0.3)
ylabel('RMSE','fontsize',12,'fontweight','bold','fontname','Times')
title('(b)','fontsize',12,'fontweight','bold','fontname','Times')