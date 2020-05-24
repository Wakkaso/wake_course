%
% Author: Sai-Keung Wong
% Institute: Computer Science
% National Chiao Tung University, Taiwan (ROC)
% Date: 2019/03/29
%
%Let X = cos((Y^2+aY)/2))
clear; syms x; syms y;
a = input('Input a:');
func = cos((y^2+a*y)/2);
d_func = diff(func, y);
s = solve(x == func, y)
ty0 = 0.5;
tx0 = subs(func, y, ty0);
for i = 1:4
    if (double(subs(s(i), x, tx0))>0)
        cpf = s(i);
        break;
    end
end
if (subs(d_func, y, ty0)<0)
    cpf = 1 - cpf;
end
my_pdf = diff(cpf);


close all;		
n = 10000000; y = rand(n,1);
x1 = cos((y.^2+a.*y)./2);
h = histogram(x1,'Normalization','pdf')
hold on
dx = (1-cos((1+a)/2))/500;
x0 = cos((1+a)/2):dx:0.99999;
f = double(subs(my_pdf, x, x0));
plot(x0,f,'LineWidth',3);
set(gca, 'Fontsize',15);
str = "X=cos((Y^2+aY)/2);"+ ...
"M:%f;SD:%f; a = %f";
tmsg = sprintf(str, mean(x1), std(x1), a);
title(tmsg);