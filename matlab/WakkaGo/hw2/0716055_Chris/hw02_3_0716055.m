%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: hw02
% Problem number: 3
% Student Name:  ¤ýÄ£¼w
% Student ID: 0716055
% Email address: bpploabc@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/03/30 Mon.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;
fprintf('Problem 2.3\n');
fprintf('Student ID:0716055 Name:¤ýÄ£¼w\n');
x = [-5:0.05:5];
while 1
	m = input('Please input m:');
    if m == -1
        fprintf('Thanks for playing.\n');
        break
    end
    while ~(m==0||m==1||m==2||m==3||m==4||m==5||m==6||m==7||m==8||m==9||m==10)
        fprintf('Input invalid. Try again.\n');
        m = input('Please input m:');
    end
    clf;
    ylim([-1.5, 1.5]);
    y1 = sin(x);
    plot(x, y1, 'LineWidth', 4);
    hold on;
    for n=(0:1:m)
        y2 = 0;
        for i=(1:2:2*n+1)
            y2 = y2 + ((-1).^((i-1)/2)/prod(1:i))*(x.^i);
        end
        plot(x,y2,'LineWidth',1);
        hold on;
    end
    ylim([-1.5, 1.5]);
end