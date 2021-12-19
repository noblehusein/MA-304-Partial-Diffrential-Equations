% Solving the 2-D Laplace's equation by the Finite Difference
%These are the values that are obtained, the circular problem was
%transformed into a cartesian problem with boundary conditionns as given
%below and the graph obtained were plotted in x and y and z plane it self
%Problem  number 10
%Specifying parameters
nx=10;                           %Number of steps in space(x)
ny=10;                           %Number of steps in space(y)       
niter=10;                       %Number of iterations 
dx=0.3489;                     %Width of space step(x)
dy=1;                     %Width of space step(y)
x=linspace(0,3.14,10);%0:dx:pi;                        %Range of x(0,pi) and specifying the grid points
y=1:dy:10;                        %Range of y(0,10) and specifying the grid points
%Initial Conditions
p=zeros(ny,nx);                  %Preallocating p
pn=zeros(ny,nx);                 %Preallocating pn
%Boundary conditions
p(:,1)=0;
p(:,nx)=0;
p(1,:)=0;                   %Dirichlet conditions
p(ny,:)=(400./pi).*(x-x.^2);               

j=2:nx-1;
i=2:ny-1;
for it=1:niter
    pn=p;
    p(i,j)=((dy^2*(pn(i+1,j)+pn(i-1,j)))+(dx^2*(pn(i,j+1)+pn(i,j-1))))/(2*(dx^2+dy^2));
    %Boundary conditions (Dirichlet conditions)
    p(:,1)=0;
    p(:,nx)=0;
    p(1,:)=0;
    p(ny,:)=(400./pi).*(x-x.^2);   
end
p(10,10)=0;
surf(-x,-y,p)



