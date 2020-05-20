%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem Category: lab2
% Problem Number: 1
% Student Name:  TSAI YU CHENG
% Student ID: 0716074
% Email Address: jacky950141@gmail.com
% Department: CS
% Date: 2020/5/10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc; close all;

% show a message about the problem in the exercise/lab/midterm/exam
disp('Lab 2.1') 

x = -10 : 0.1 : 10;

y11 = cos(2.*1.*x);
y12 = 2.*x.*sin(1^2.*x) ./ (x.^2 + 1) - 2;
y21 = cos(2.*2.*x);
y22 = 2.*x.*sin(2^2.*x) ./ (x.^2 + 1) - 2;
y31 = cos(2.*3.*x);
y32 = 2.*x.*sin(3^2.*x) ./ (x.^2 + 1) - 2;
y41 = cos(2.*4.*x);
y42 = 2.*x.*sin(4^2.*x) ./ (x.^2 + 1) - 2;


subplot(2,2,1);
hold on;
plot(x,y11,'LineWidth',3,'Color','r');
plot(x,y12,'LineWidth',3,'Color','b');
title({'cos(2*1*x)';'2*x*sin(1^2*x)/(x^2+1)-2'});
subplot(2,2,2);
hold on;
plot(x,y21,'LineWidth',3,'Color','r');
plot(x,y22,'LineWidth',3,'Color','b');
title({'cos(2*2*x)';'2*x*sin(2^2*x)/(x^2+1)-2'});
subplot(2,2,3);
hold on;
plot(x,y31,'LineWidth',3,'Color','r');
plot(x,y32,'LineWidth',3,'Color','b');
title({'cos(2*3*x)';'2*x*sin(3^2*x)/(x^2+1)-2'});
subplot(2,2,4);
hold on;
plot(x,y41,'LineWidth',3,'Color','r');
plot(x,y42,'LineWidth',3,'Color','b');
title({'cos(2*4*x)';'2*x*sin(4^2*x)/(x^2+1)-2'});


for k = 1 : -0.01 : 0
    subplot(2,2,1);
    y1 = k .* y11 + (1-k) .* y12;
    f1 = plot(x,y1,'LineWidth',1.5,'Color','y');
    subplot(2,2,2);
    y2 = k .* y21 +(1-k) .* y22;
    f2 = plot(x,y2,'LineWidth',1.5,'Color','y');
    subplot(2,2,3);
    y3 = k .* y31 + (1-k) .* y32;
    f3 = plot(x,y3,'LineWidth',1.5,'Color','y');
    subplot(2,2,4);
    y4 = k .* y41 + (1-k) .* y42;
    f4 = plot(x,y4,'LineWidth',1.5,'Color','y');
    pause(1/30);
    
    if k ~= 0
        delete(f1);
        delete(f2);
        delete(f3);
        delete(f4);
    end
end
