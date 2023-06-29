clear all
clc

f=@(x,y)x*y;
format long;
x0=0;
y0=0.35502805388;
y0p=0.2588194079;

x=0:0.01:6;
y=y0;
yp=y0p;
h=0.01;

xv=zeros(601,1);
yv=zeros(601,1);
ypv=zeros(601,1);
for i=1:601
    xv(i)=x(i);
    yv(i)=y;
    ypv(i)=yp;
    
    X=[0 1;-x(i) 0];
    Y=[y;yp];
    
    k1 = f(X,Y);
    k2 = f(X+[0 0;-0.5*h 0],Y+0.5*h*k1);
    k3 = f(X+[0 0;-0.5*h 0],Y+0.5*h*k2);
    k4 = f(X+[0 0;-h 0],Y+h*k3);

    Y= Y + h/6 * (k1+2*k2+2*k3+k4);
    y = Y(1);
    yp =Y(2);
end
plot(xv,yv)




