<<<<<<< HEAD
format long
a = 1; b = -37548000000; c = 1;
x1 = (-b+sqrt(b^2-4*a*c))/2; 
x2 = (-b-sqrt(b^2-4*a*c))/2; 
x = [x1 x2] 
err = abs(x.^2 + b.*x + c)

e = max(abs([x.^2, b.*x, c]))*eps
=======
format long
a = 1; b = -37548000000; c = 1;
x1 = (-b+sqrt(b^2-4*a*c))/2; 
x2 = (-b-sqrt(b^2-4*a*c))/2; 
x = [x1 x2] 
err = abs(x.^2 + b.*x + c)

e = max(abs([x.^2, b.*x, c]))*eps
>>>>>>> 542a0a8303d7514c52d858d6ed680356c059c9eb
