format long
a = 1; b = -37548000000; c = 1;
x1 = (-b+sqrt(b^2-4*a*c))/2; 
x2 = (-b-sqrt(b^2-4*a*c))/2; 
x = [x1 x2] 
err = abs(x.^2 + b.*x + c)

e = max(abs([x.^2, b.*x, c]))*eps
