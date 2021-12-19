%Solving 1(b) with Crank Nickolson Scheme
clc;
clear all;
T=0.4; l=1; h=1/4; k=0.005; n=l/h; m=T/k; r=k/h^2;
A=zeros(n-1); u=zeros(n+1,m+2);
b=zeros(n-1,1);
%We solve this problem using A*x=B method.
%So let us assign A matrix using "r" values
for i=1:n-2
    A(i,i)=1+r; A(i,i+1)=-r/2; A(i+1,i)=-r/2;
end
A(n-1,n-1)=1+r;
%Initial Conditions
u(1,1)=0; u(2,1)=3/16; u(3,1)=1/4; u(4,1)=3/16; u(5,1)=0; %u(6,1)=1.25; u(7,1)=1.5; u(8,1)=1.75;u(9,1)=1;

%defining b vector
b(1)=(1-r)*u(2,1)+(r/2)*(u(1,1)+u(1,2)+u(3,1));
for i=3:n-1
    b(i-1)=(1-r)*u(i,1)+(r/2)*(u(i+1,1)+u(i-1,1));
end
b(n-1)=(1-r)*u(n,1)+(r/2)*(u(n+1,1)+u(n+1,2)+u(n-1,1));

%Solving the initial vector data in a single shot
v=A\b;

for j=2:m+1
    for i=1:n-1
        u(i+1,j)=v(i);
    end
    %Reassining b value using the new obtained values of u.
    b(1)=(1-r)*u(2,j)+(r/2)*(u(1,j)+u(1,2)+u(3,j));
    for z=3:n-1
    b(z-1)=(1-r)*u(z,j)+(r/2)*(u(z+1,j)+u(z-1,j));
    end
    b(n-1)=(1-r)*u(n,j)+(r/2)*(u(n+1,j)+u(n+1,j+1)+u(n-1,j));
    %Solving the linear equations again.
    v=A\b;
end

v=u(:,1:m+1); t=0:k:T; x=0:h:1;

%Using Basic 3-D plotting again
[X T]=meshgrid(x,t); surf(T,X,v');
xlabel('time'), ylabel('distance'), zlabel('Temp u(x,t)');




