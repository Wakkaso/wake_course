a = 1;
b = -3.754006020081200e-04;
c = 3.3517068341857e-08;

x1 = (-b+sqrt(b^2-4*a*c))/2


x = x1;
y = abs(x^2 + b*x + c)

err =  max(abs([x^2, b*x, c]))*eps;
    
if ( abs(y) < err)
    
    fprintf('correct. Absolute error is %f\n', y);
else
    fprintf('Incorrect. Absolute error is %f\n', y);
end

