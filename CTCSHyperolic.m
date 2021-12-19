%Problem No.8(a)
clc;
clear all
c=1;l=1;T=2; k=0.05;h=0.1; r=c*k/h;
x=0:0.1:l;t=0:0.1:T;
nx=length(x);nt=length(t);
g=zeros(1,nx);f=sin(pi*x);
u=zeros(nx,nt);
for i=1:nx
    u(i,1)=f(i);
end
for i=2:nx-1
    u(i,2)= 0.5*r^2*(f(i-1)+f(i+1))+(1-r^2)*f(i)+k*g(i);
end
for j=2:nt-1
    for i=2:nx-1
        u(i,j+1)=(2-2*r^2)*u(i,j)+r^2*(u(i+1,j)+u(i-1,j))-u(i,j-1);
    end
end
[X T]=meshgrid(x,t);
surf(T,X,u')
xlabel('time'),ylabel('distance');
zlabel('displacement');