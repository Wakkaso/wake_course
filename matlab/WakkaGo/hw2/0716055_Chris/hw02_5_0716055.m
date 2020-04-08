%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: hw02
% Problem number: 5
% Student Name:  ¤ýÄ£¼w
% Student ID: 0716055
% Email address: bpploabc@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/03/30 Mon.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; clf;
dt = 0.02;
a = input('Please input a: ');
dk = input('Please input dk: ');
while a<0 || a>1 || dk<0.1 || dk>1
    fprintf('Input invalid. Try again.\n');
    a = input('Please input a: ');
    dk = input('Please input dk: ');
end
for k = (0:dk:1)
    p = 10; v = 0; t = 0; M = []; T = []; 
    while t < 10
        v = v - a*dt;
        p = p + k*v*dt;
        if p<0
            p = 0;
            v = -v;
        end
        T = [T,t];
        M = [M,p];
        t = t + dt;
    end
    plot(T, M, 'linewidth', 3);
    hold on
end
