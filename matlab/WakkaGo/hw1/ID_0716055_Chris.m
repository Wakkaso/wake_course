%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 1
% Student Name: ¤ýÄ£¼w
% Student ID: 0716055
% Email address: bpploabc.cs07@nctu.edu.tw
% Department: Computer Science, NCTU
% Date: 2020/03/14 Sat.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Problem 1.1');clf;clear;clc;
n = 8;
P = (-n:2:n);
P

disp('Problem 1.2');clf;clear;clc;
z = meshgrid((1./(-3:3)).^(3:-1:-3));
z

disp('Problem 1.3');clf;clear;clc;
n = 10;
X = (-1*ones(1,n)).^[2:n+1];
X

disp('problem 1.4');clf;clear;clc;
n = 10;
X = (-1*ones(1,n)).^(1:n)./2.+1.5;
X

disp('problem 1.5');clf;clear;clc;
n=5;
X = (mod(0:n-1 ,3))+1;
X

disp('problem 2.1');clf;clear;clc;
[x ,y] = meshgrid(-8:0.01:8);
z = y * sin(x);
mesh(z);
shading interp;

disp('problem 2.2');clf;clear;clc;
x = (0:0.01:4);
a = x;
b = x.^2;
c = x.^3;
d = exp(x);
e = exp(-x);
f = log(x);
plot(x,a,x,b,x,c,x,d,x,e,x,f);
legend({'y = x','y = x^2', 'y = x^3', 'y = exp(x)', 'y = exp(-x)', 'y = log(x)'},...
    'Location','northwest');

disp('problem 2.3');clf;clear;clc;
x= (-10:0.001:10);
y = sin(x)-x;
z = sin(y.^2)-exp(x)./x;
x1 = (-10:0.5:10);
y1 = sin(x1)-x1;
z1 = sin(y1.^2)-exp(x1)./x1;
plot(x,z, '-', x1,z1,'or');

disp('problem 2.4');clf;clear;clc;
[x ,y] = meshgrid(-10:0.5:10);
z = (x + y) ./ (x.^2 +  y.^2 + 1);
meshc(z);
shading faceted;

disp('problem 2.5');clf;clear;clc;
x = (-10:0.05:10);
y1 = 0.5 + (x.*sin(x)) ./ ( x.^2.*exp(sin(x)) + 1);
y2 = cos(x).^2 + sin(x).^2;
plot(x,y1,x,y2);



