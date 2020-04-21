%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 1
% Student Name: TSAI YU-CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: Computer Science, NCTU
% Date: 3/15
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('problem 1.1');clf; clear; clc;
n = 8;
P = [-n:2:n];
disp(P);

disp('problem 1.2');clf; clear; clc;
X=meshgrid((1./(-3:3)).^(3:-1:-3));
disp(X);

disp('problem 1.3');clf; clear; clc;
n = 10;
X = [(-1).*(-1).^(1:n)];
disp(X);

disp('problem 1.4');clf; clear; clc;
n = 10;
X = [(-1).*(-1).^(1:n)].*(-1/2)+3/2;
disp(X);

disp('problem 1.5');clf; clear; clc;
n = 10;
X = [mod(0:n-1,3)+1];
disp(X);

disp('problem 2.1');clf; clear; clc;
[x,y] = meshgrid(-8:0.01:8, -8:0.01:8);
z = y.*sin(x);
mesh(z);
shading interp;


disp('problem 2.2');clf; clear; clc;
x = (0:0.01:4);
y1 = x;
y2 = x.^2;
y3 = x.^3;
y4 = exp(x);
y5 = exp(-x);
y6 = log(x);
plot(x,y1,x,y2,x,y3,x,y4,x,y5,x,y6);
legend({'y = x','y = x^2','y = x^3','y = e^x','y = e^(-x)','y = log(x)'}...
    ,'Location','northwest','NumColumns',2);

disp('problem 2.3');clf; clear; clc;
%line
x = (-10:0.001:10);
y = sin(x)-x;
z = sin(y.^2)-exp(x)./x;
%'o'
x1 = (-10:0.05:10);
y1 = sin(x1)-x1;
z1 = sin(y1.^2)-exp(x1)./x1;
plot(x,z,'-',x1,z1,'or');

disp('problem 2.4');%clf; clear; clc;
[x,y] = meshgrid(-10:0.05:10);
z = (x + y) ./ (x.^2 +  y.^2 + 1);
meshc(z);
shading faceted;

disp('problem 2.5');clf; clear; clc;
x = (-10:0.05:10);
y1 = 0.5 + (x.* sin(x)) ./ ( (x.^2).* exp(sin(x)) + 1);
y2 = (cos(x)).^2 + (sin(x)).^2;
plot(x,y1,x,y2);
