function pre=GPApreZhao(M)
global Mw X h delh delFr Ck
a=M(1);b=M(2);c=M(3);d=M(4);
e=M(5);Fr=M(6);
r=X+c*exp(d*Mw);
pre=a*Mw+b*X-log(r)+e*(h-15).*delh+Fr*delFr+Ck;
end