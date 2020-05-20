%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem Category: ? exercise/lab/midterm/exam
% Problem Number: ?
% Student Name:  ?
% Student ID: ?
% Email Address: ?
% Department: ?
% Date: ?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show a message about the problem in the exercise/lab/midterm/exam
disp('Lab Problem 2.1')
y1 = [];
y2 = [];
x = -10:0.1:10;
for i = 1:4
    y1 = [y1; cos(2.*i.*x)];
    y2 = [y2; 2.*x.*sin(i.^2.*x)./(x.^2+1)-2];
end

figure(1);
xlim([-10 10]);
for k = 1:-0.01:0
    clf;
    for i = 1:4
        subplot(2,2,i);
        hold on;
        plot(x,y1(i,:), 'r', 'linewidth', 3);
        plot(x,y2(i,:), 'b', 'linewidth', 3);
        y = k.*y1(i,:) + (1-k).*y2(i,:);
        plot(x,y,'y' ,'linewidth', 1.5);
        if i == 1
            title({'cos(2*1*x)','2*x*sin(1^2*x)/(x^2+1)-2'});
        elseif i == 2
            title({'cos(2*2*x)','2*x*sin(2^2*x)/(x^2+1)-2'});
        elseif i == 3
            title({'cos(2*3*x)','2*x*sin(3^2*x)/(x^2+1)-2'});
        elseif i == 4
            title({'cos(2*4*x)','2*x*sin(4^2*x)/(x^2+1)-2'});
        end
    end
    pause(0.033);
end



