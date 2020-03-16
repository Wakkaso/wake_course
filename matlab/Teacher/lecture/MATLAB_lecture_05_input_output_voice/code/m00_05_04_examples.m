%{ 
y1 = ( x^3 cos x^2 )/(x^2 + 1) -1
y2 = x^2 cos x 
x = [-10:0.01:10]. Step size 0.01 
%}

clf
x = [-10:0.01:10];
y1 = (x.^3 .* cos (x.^2)) ./ (x.^2 + 1) - 1;
y2 = x.^2 .* cos(x);
plot(x, y1,'Linewidth', 2);
hold on
plot(x, y2,'Linewidth', 2);

x = [-10:0.5:10];
y1 = (x.^3 .* cos (x.^2))...
	 ./ (x.^2 + 1) - 1;
y2 = x.^2 .* cos(x);

i1 = find(y1<y2);
y11 = y1(i1);
x11 = x(i1);
hold on
plot(x11, y11,'k+','Linewidth', 2);



