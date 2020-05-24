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
disp('Lab Problem 1.1');

x = -5:0.01:5;

y11 = sin(x).*sqrt(abs(x));
y12 = 2.*cos(x).*exp(cos(x.^2));

y21 = sin(x)+x.^2.*cos(x); 
y22 = 2.*sin(x).*exp(sin(x.^2));

y31 = sin(x)+(sin(x)).^2;
y32 = cos(x)+(cos(x)).^2;

y41 = x.^5.*cos(x).*exp(-abs(x));
y42 = x.^5.*sin(x).*exp(-abs(x));

while 1
    n = input('input n: ');
    while n<0 || n>10000
        n = input('input n: ');
    end

    if n == 0
        disp('0716055 ¤ýÄ£¼w');
        return;
    end

    p1 = [];
    p2 = [];
    p3 = [];
    p4 = [];
    
    num = 0;
    while num < n
        a = -5+rand(1)*10;
        b = -15+rand(1)*30;
        if (sin(a).*sqrt(abs(a))-b)*(2.*cos(a).*exp(cos(a.^2))-b)<0
            p1 = [p1; a, b];
            num = num+1;
        end
    end
    num = 0;
    while num < n
        a = -5+rand(1)*10;
        b = -15+rand(1)*30;
        if (sin(a)+a.^2.*cos(a)-b)*(2.*sin(a).*exp(sin(a.^2))-b)<0
            p2 = [p2; a, b];
            num = num+1;
        end
    end
    num = 0;
    while num < n
        a = -5+rand(1)*10;
        b = -15+rand(1)*30;
        if (sin(a)+(sin(a)).^2-b)*(cos(a)+(cos(a)).^2-b)<0
            p3 = [p3; a, b];
            num = num+1;
        end
    end
    num = 0;
    while num < n
        a = -5+rand(1)*10;
        b = -15+rand(1)*30;
        if (a.^5.*cos(a).*exp(-abs(a))-b)*(a.^5.*sin(a).*exp(-abs(a))-b)<0
            p4 = [p4; a, b];
            num = num+1;
        end
    end
    
    op = input('input op: ');
    if op == 1
        clf;
        figure(1);
        plot(p1(:,1), p1(:,2), 'g.');
        hold on;
        plot(x, y11, 'r', 'linewidth', 3);
        hold on;
        plot(x, y12, 'b', 'linewidth', 3);
        hold on;
        grid on;
    elseif op == 2
        clf;
        figure(1);
        subplot(2,1,1);
        plot(p1(:,1), p1(:,2), 'g.');
        hold on;
        plot(x, y11, 'r', 'linewidth', 3);
        hold on;
        plot(x, y12, 'b', 'linewidth', 3);
        hold on;
        xticks(-5:5:5);
        yticks(-15:5:15);
        grid on;
        subplot(2,1,2);
        plot(p2(:,1), p2(:,2), 'g.');
        hold on;
        plot(x, y21, 'r', 'linewidth', 3);
        hold on;
        plot(x, y22, 'b', 'linewidth', 3);
        hold on;
        xticks(-5:5:5);
        yticks(-15:5:15);
        grid on;
    elseif op == 3
        clf;
        figure(1);
        subplot(2,2,1);
        plot(p1(:,1), p1(:,2), 'g.');
        hold on;
        plot(x, y11, 'r', 'linewidth', 3);
        hold on;
        plot(x, y12, 'b', 'linewidth', 3);
        hold on;
        subplot(2,2,2);
        plot(p2(:,1), p2(:,2), 'g.');
        hold on;
        plot(x, y21, 'r', 'linewidth', 3);
        hold on;
        plot(x, y22, 'b', 'linewidth', 3);
        hold on;
        subplot(2,2,3);
        plot(p3(:,1), p3(:,2), 'g.');
        hold on;
        plot(x, y31, 'r', 'linewidth', 3);
        hold on;
        plot(x, y32, 'b', 'linewidth', 3);
        hold on;
        subplot(2,2,4);
        plot(p4(:,1), p4(:,2), 'g.');
        hold on;
        plot(x, y41, 'r', 'linewidth', 3);
        hold on;
        plot(x, y42, 'b', 'linewidth', 3);
        hold on;
        grid on;
    end


    
end


