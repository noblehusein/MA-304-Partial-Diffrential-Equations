%Tutorial Problem #1 Solved using FTCS
clc;
clear all;

n=4;h=1/4;k=0.005;T=0.2;m=40;r=0.32; %Setting all The initial Parameters
A=zeros(n-1,n+1); %making the matrix "A" such that Uj+1= A* Uj (roughly)
u=zeros(n+1,m); %The solution matrix
for i=1:n-1
    A(i,i)=r;
    A(i,i+1)=1-2*r;
    A(i,i+2)=r;
end
u(1,1)=0; u(2,1)=3/16; u(3,1)=1/4; u(4,1)=3/16; u(5,1)=0; %Giving initial values
v=A*u(:,1);% Assigning a dummy vector that will store the u value temporarily

for j=2:m+1
    for i=1:n-1
        u(i+1,j)=v(i);
    end
v=A*u(:,j); %re-assigning the new "u" value to v
end
t=0:k:T;
x=0:h:1;

u
%Basic 3-D Plotting
[X T]=meshgrid(x,t);
surf(T , X, u')
xlabel('time'), ylabel('distance x')
zlabel('temp')
    