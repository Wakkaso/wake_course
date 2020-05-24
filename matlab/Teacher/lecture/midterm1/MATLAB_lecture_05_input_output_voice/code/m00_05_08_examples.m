%{
y = ax2 + b
There are a set of curves in the above form. 
Their coefficients, a and b, are stored in 
two vectors A and B, respectively. Draw all the curves.
Thus, A(i) and B(i) define one curve:

y = A(i) x2 + B(i), 
for 1 <= i <= the total number of curves.

Assume A = [-5:1:5], and B = [-10:2:10].
%}

A = [-5:1:5]; B = [-10:2:10];

x = [-10:0.05:10];
clf
for a = A
    for b = B
        y = a.*x.^2 + b;
        plot(x,y, 'linewidth',1);
        hold on
    end
end
ylim([0, 200]);
xlim([8, 10]);

