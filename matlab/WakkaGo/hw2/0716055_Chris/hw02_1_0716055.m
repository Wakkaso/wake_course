%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: hw02
% Problem number: 1
% Student Name:  ¤ýÄ£¼w
% Student ID: 0716055
% Email address: bpploabc@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/03/30 Mon.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;
fprintf('Problem 2.1\n');
fprintf('Student ID:0716055 Name:¤ýÄ£¼w\n');
x = [-10:0.05:10];
while 1
	v = input('Please input a vector (a0,b0):');
    a0 = v(1);
    b0 = v(2);
    if a0 == 0 && b0 == 0
        fprintf('Thanks for playing.\n');
        break
    end
    clf;
    a = (a0-10:1:a0+10);
    b = (b0-10:1:b0+10);
    for i=(1:21)
        for j=(1:21)
            y = a(i) .*sin(x) + b(j) .*cos(x);
            plot(x,y);
            hold on;
        end
    end
end
