close all; clf; clear; clc;

% show Lab Two Example
disp('Lab Two Example')  

t = 0;
p1 = [0 0];
v1 = [15 20];
dt = 0.002;
m1 = 1;
g1 = 2;
n1 = [0 -1];

p2 = [0 0];
v2 = [15 20];
m2 = 1;
g2 = 2;
n2 = [0 -1];
while true
    d = input('Please input d:');
    if (d(1)<0||d(2)<0) 
        return;
    end
    if (d(1)<=1&&d(2)<=1) 
        break;
    end    
end
fig = p1;
fig2 = p2;
while (t<2) 
    f = m1.*g1.*n1;
    a = f./m1 - d(1).*v1;
    v1 = v1 + a.*t;
    p1 = p1 + v1.*t;
    fig = [fig; p1];
    
    f2 = m2.*g2.*n2;
    a2 = f2./m2 - d(2).*v2;
    v2 = v2 + a2.*t;
    p2 = p2 + v2.*t;
    fig2 = [fig2; p2];
    
    t = t + dt;
    clf;
    subplot(1,2,1);
    plot(fig(:,1), fig(:,2),'.');
    hold on;
    plot(p1(1), p1(2),'bo', 'linewidth', 3);
    grid on;
    axis([0 400 -100 100]);
    
    subplot(1,2,2);
    plot(fig2(:,1), fig2(:,2),'.');
    hold on;
    plot(p2(1), p2(2),'bo', 'linewidth', 3);
    grid on;
    axis([0 400 -100 100]);
    pause(dt);
end

