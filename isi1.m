function [Obj_best1,Obj_med1,Obj_Iqr1,Swarm_Pot1]=isi1(All1,ii)    
Stat1=All1(ii).Stat;
Obj_best1=[Stat1(:,1)];
Obj_med1=[Stat1(:,2)];
Obj_Iqr1=[Stat1(:,3)];
Swarm_Pot1=[Stat1(:,4)];
end