function [ res ] = Nagaoka(B,Rx,Bfix,step,alp,pathfi)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
hold on;
[q,w]=min(B);
Rxxdd=Rx(w);
for i=1:length(B)
    newY(i)=(Rx(i)-Rxxdd)/(Rxxdd^2);
end
cop3=newY(end:-1:1);
newY=[cop3,newY];

c=-B(end:-1:1);
cop2=Rx(end:-1:1);
cop2=cop2';
c=c';
Rx=Rx';
B=B';
Rx=[cop2,Rx];
B=[c,B];
stepio=2*Bfix/step;
ressX=-Bfix:stepio:Bfix;
ressX=ressX(ressX~=0);
for i=1:length(ressX) 
ressY(i)=alp*1.2317e-05*(psi(0.5+(1.6469e-16)/(pathfi*pathfi*abs(ressX(i))))-log((1.6469e-16)/(pathfi*pathfi*abs(ressX(i)))));
end
hold on;
plot(ressX,ressY);
plot(B,newY);
res=0;
end

