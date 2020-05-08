%
% Author: Sai-Keung Wong
% Institute: Computer Science
% National Chiao Tung University, Taiwan (ROC)
% Date: 2019/03/29
%
%Let X = 1-Y^2
clear; syms x; syms y;
func = 1-y^2;
s = solve(x == func, y)
d_func = diff(func);
ty0 = 0.5;                  % testing
tx0 = double(subs(func, y, ty0));
for i = 1:2
    if (double(subs(s(i), tx0))>0)
        cpf = s(i);
        break;
    end
end
if (double(subs(d_func, y, ty0)) < 0)
    cpf = 1 - cpf;
end
my_pdf = diff(cpf);

close all;		
n = 10000000; y = rand(n,1);
x1 = 1-y.^2;
h = histogram(x1,'Normalization','pdf')
hold on
dx = 1/500;
x0 = 0:dx:0.99999;
f = double(subs(my_pdf, x, x0));
plot(x0,f,'LineWidth',3);
set(gca, 'Fontsize',15);
