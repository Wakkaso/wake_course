%{ 
Write a program to plot a function y.
y = y1; if x < -5 or  (x >1 and x < 2) or x > 5
y = y2; otherwise
y1 = sin x + x cos x^2 -1
y2 = x^2 cos x + sqrt(|x|)
x in [-10, 10]. The step size is 0.01. 
%}

clf
x1 = [-10:0.01:-5-eps];     %y1
x2 = [-5:0.01:1];           %y2
x3 = [1+eps:0.01:2-eps];    %y1
x4 = [2:0.01:5];            %y2
x5 = [5+eps:0.01:10];       %y1

x = x1;
f1 = sin(x) + x .* cos(x.^2) - 1;
x = x2;
f2 = x.^2 .* cos(x) + sqrt(abs(x));
x = x3;
f3 = sin(x) + x .* cos(x.^2) - 1;
x = x4;
f4 = x.^2 .* cos(x) + sqrt(abs(x));
x = x5;
f5 = sin(x) + x .* cos(x.^2) - 1;

X = [x1, x2, x3, x4, x5];
Y = [f1, f2, f3, f4, f5];
plot(X, Y,'Linewidth', 2);

