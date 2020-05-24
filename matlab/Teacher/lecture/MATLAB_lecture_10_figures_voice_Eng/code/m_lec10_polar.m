clear;close all;


x = 0:0.01:pi*0.75;
r = sin(x);
polar(x,r);
input('Press ENTER to start.');
hold on;
for x0 = x
    r0 = sin(x0);
     polar(x0,r0,'o');
  pause(0.033);
end
hold off;


%
clear;close all;
x = 0:0.01:pi*2;
r = cos(2*x).*sin(2*x);
figure
polar(x,r);
input('Press ENTER to start.');
hold on;
for x0 = x
  r0 = cos(2*x0).*sin(2*x0);
  polar(x0,r0,'o');
  pause(0.033);
end
hold off;

