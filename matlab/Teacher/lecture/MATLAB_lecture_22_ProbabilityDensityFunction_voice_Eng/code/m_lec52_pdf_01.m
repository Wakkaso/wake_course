%
% Author: Sai-Keung Wong
% Institute: Computer Science
% National Chiao Tung University, Taiwan (ROC)
% Date: 2019/03/29
%
clear
syms x;
cpf = (-1+sqrt(1+4*x))/2;
diff(cpf)

clear
syms x; syms y;
solve(y+y^2 == x, y)
cpf = (-1+sqrt(1+4*x))/2;
diff(cpf)
