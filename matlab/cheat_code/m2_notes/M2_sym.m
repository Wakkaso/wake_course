% syms a;
% qEq = str2sym('d = a*x^2+b*x+c');
% solve(qEq)



% syms x
% solve(x^3 - 7*x == 2 - 8*x^2)


% % Solve Systems of Algebraic Equations
% syms x y z
% [x, y, z] = solve(z == 3*x, x == y+2, y == 2*z + x)

% % diff
% syms x
% f = x^2;
% diff(f)


% % Partial Derivatives
% 
% syms x y
% f = x*y + x*x + y*y;
% diff(f,y)
% ans =
% x + 2*y


% % Integral
% c = 1; sigma = 2; r1 = 4; r2 = 6;                                                    
% y = str2sym('2.718281828^(-(x-1)^2/8)');
% A = int(y,'x', 4, 6);
