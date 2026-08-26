function pre=GPApreBindi(M)
global Mw R Vs30 En Er Es
    Ref=1;Mh=6.75;a=Mw-Mh;
    e1=M(1);c1=M(2);c2=M(3);h=M(4);
    c3=M(5);b1=M(6);b2=M(7);b3=M(8);
    gamma=M(9);Fn=M(10);Fr=M(11);Fs=M(12);
    FD=(c1+c2*(Mw-4.5)).*log10((R.^2+h^2).^0.5./Ref)-c3*(((R.^2+h^2).^0.5)-Ref);
    n=length(Mw);FM=zeros(n,1);
    for ii=1:n
        if Mw(ii)<=Mh
            FM(ii)=b1*a(ii)+b2*a(ii)^2;
        else
            FM(ii)=b3*a(ii);
        end 
    end
    FS=gamma*log10(Vs30/800);
    FSOF=Fn*En+Fr*Er+Fs*Es;
    pre=e1+FD+FM+FS+FSOF;
end