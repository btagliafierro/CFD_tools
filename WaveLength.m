function [L]=Theorylength(T,d)
g=9.81;
f=@(x) g*T^2/2/pi*tanh(2*pi*d/x)-x;
f1=@(x) -g*d*(T/x)^2*sech(2*pi*d/x)^2-1;
x=g*T^2/(2*pi); fail=0;
while 1
    fail=1+fail;
    x1=x-f(x)/f1(x);
    res=abs(x-x1);
    %disp(res);
    if res<10^-14; 
      break
    else 
      x=x1
    end
    if fail>1000
      disp('error')
      break
    end
end
L=x;
end
