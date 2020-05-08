%
% Author: Sai-Keung Wong
% Institute: Computer Science
% National Chiao Tung University, Taiwan (ROC)
% Date: 2019/03/29
%
%Let X = 1-Y
clear; syms x; syms y;
func = 1-y;
s = solve(x == func, y)
ty0 = 0.5;                  % testing
tx0 = subs(func, y, ty0);
d_func = diff(func);

cpf = s(1);
if (subs(d_func, y, ty0) < 0)
    cpf = 1 - cpf;
end

my_pdf = diff(cpf);

close all;		
n = 10000000; yv = rand(n,1);
%x1 = double(subs(func, y, yv));
x1 = 1 - yv;
h = histogram(x1,'Normalization','pdf')
hold on
dx = 1/500;
x0 = 0:dx:1;
f = double(subs(my_pdf, x, x0));
plot(x0,f,'LineWidth',3);
set(gca, 'Fontsize',15);
