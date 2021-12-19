%problem number 12
clc;
clear all;
h=0.2;
t=0.1;
r=0.5;
x=linspace(0,2,11);
t=linspace(0,1,10);

U=zeros(6,11);

%Setting Boundary conditions for time
for i=1:11
    U(i,1)=(i-1)*h;
end
%Setting boundary conditions for space

for j=1:11
    if j<7
    U(1,j)=(j-1)*h*((j-1)*h-1);
    else
    U(1,j)=(1-(j-1)*h);
    end
end
U
%Now we Jesht fill in the matrix using the iteration scheme
for i=2:11
    for j=2:10
        U(j,i)=(1-r^2)*U(j,i-1)+0.5*r*(r-1)*(U(j+1,i-1))+0.5*r*(r+1)*(U(j-1,i-1));
    end
end
U=U(1:10,1:11)
surf(x,t,U)
xlabel('Distance in X axis')
ylabel('Time (Y-axis)')
zlabel('Value of U in Z')