%
% Author: Sai-Keung Wong
% Institute: Computer Science
% National Chiao Tung University, Taiwan (ROC)
% Date: 2019/03/29
%
%
%Let X = e^Y-1.

clear
syms x; syms y;
solve(x == exp(y)-1, y)
cpf = log(x + 1);
diff(cpf)

%1/(x + 1)
close all; clear;clf;		
n = 10000000; y = rand(n,1);
x = exp(y)-1;
h = histogram(x,'Normalization','pdf')
hold on
x = 0.001:0.01:exp(1)-1;
f = 1./(x + 1);
plot(x,f,'LineWidth',3);
set(gca, 'Fontsize',15);
