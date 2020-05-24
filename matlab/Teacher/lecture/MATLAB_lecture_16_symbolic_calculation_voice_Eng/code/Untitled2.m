clear
x1=sym('x1'); x2 = sym('x2');
f = sin(x1)*x2+ x1+x2+x1+cos(x1);

v = sym('r0*r1*pi');

cArea = sym('area = r0*r1*pi');


syms x y
f = x*y + x*x + y*y;
diff(f)

syms x
solve(x^3 - 7*x == 2 - 8*x^2)

syms x
x0 = solve(sin(x) - 7*x == 2 - 8*x^2)
x = x0;
sin(x) - 7*x - (2 - 8*x^2)

syms x y
f = sin(y)^2 + cos(x)^2;
diff(f)

syms x y z
[x, y, z] = solve(z == 3*x, x == y+2, y == 2*z + x)


syms x y z
[x, y, z] = solve(z == 3*x, x == y+2, y == z + y^2)
