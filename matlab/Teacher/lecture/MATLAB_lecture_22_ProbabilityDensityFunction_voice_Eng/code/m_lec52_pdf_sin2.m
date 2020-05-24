%
% Author: Sai-Keung Wong
% Institute: Computer Science
% National Chiao Tung University, Taiwan (ROC)
% Date: 2019/03/29
%
%Let X = 3sin(Y^2).
clear
syms x; syms y;
solve(x == 3*sin(y^2), y)
cpf = asin(x/3)^(1/2);
diff(cpf)

%1/(6*asin(x/3)^(1/2)*(1 - x^2/9)^(1/2))
close all; clear;clf;		
n = 10000000; y = rand(n,1);
x = 3*sin(y.^2);
h = histogram(x,'Normalization','pdf')
hold on
x = 0.001:0.01:3*sin(1);
f = 1./(6.*asin(x./3).^(1/2).*(1 - x.^2/9).^(1/2));
plot(x,f,'LineWidth',3);
set(gca, 'Fontsize',15);
