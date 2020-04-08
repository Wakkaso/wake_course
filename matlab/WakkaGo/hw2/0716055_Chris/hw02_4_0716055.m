%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: hw02
% Problem number: 4
% Student Name:  ¤ýÄ£¼w
% Student ID: 0716055
% Email address: bpploabc@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/03/30 Mon.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;
fprintf('Problem 2.4\n');
fprintf('Student ID:0716055 Name:¤ýÄ£¼w\n');
x1 = [-5:0.005:-2-eps];
x2 = [-2:0.005:7];
x3 = [7+eps:0.005:10];
x = x1;
y1 = (5.*x.^2+2*x+7)./(x.^2-5.*x-14);
x = x2;
y2 = (5.*x.^2+2*x+7)./(x.^2-5.*x-14);
x = x3;
y3 = (5.*x.^2+2*x+7)./(x.^2-5.*x-14);
clf;
plot(x1, y1, 'r', x2, y2, 'b', x3, y3, 'r', 'Linewidth', 2);



