%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 1
% Student Name: TSAI YU-CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: Computer Science, NCTU
% Date: 3/31
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clf; clear; clc;
disp('problem 4');
clf; clear; clc;
fprintf('Student ID:0716074  Name:TSAI YU-CHENG\n');
clf
x = -5:0.005:10;
y = (5.*x.^2+2.*x+7)./(x.^2-5.*x-14);
plot(x, y,'-r','Linewidth', 2);
hold on;
i1 = find(y<0);
y1 = y(i1);
x1 = x(i1);
hold on
plot(x1, y1,'-b','Linewidth', 2);
