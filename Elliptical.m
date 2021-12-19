% Solving the 2-D Laplace's equation by the Finite Difference
%Problem  number
%Specifying parameters
nx=4;                           %Number of steps in space(x)
ny=4;                           %Number of steps in space(y)       
niter=10;                       %Number of iterations 
dx=1/(nx-1);                     %Width of space step(x)
dy=1/(ny-1);                     %Width of space step(y)
x=0:dx:1;                        %Range of x(0,1) and specifying the grid points
y=0:dy:1;                        %Range of y(0,1) and specifying the grid points
%Initial Conditions
p=zeros(ny,nx);                  %Preallocating p
pn=zeros(ny,nx);                 %Preallocating pn
%Boundary conditions
p(:,1)=0;
p(:,nx)=x;
p(1,:)=0;                   %Dirichlet conditions
p(ny,:)=y;               

j=2:nx-1;
i=2:ny-1;
for it=1:niter
    pn=p;
    p(i,j)=((dy^2*(pn(i+1,j)+pn(i-1,j)))+(dx^2*(pn(i,j+1)+pn(i,j-1))))/(2*(dx^2+dy^2));
    %Boundary conditions (Dirichlet conditions)
    p(:,1)=0;
    p(:,nx)=x;
    p(1,:)=0;
    p(ny,:)=y;   
end

%Plotting the solution
surf(x,y,p);       
