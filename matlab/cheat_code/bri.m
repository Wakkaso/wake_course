%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem Category: lab
% Problem Number: 1
% Student Name:  Chris Wang
% Student ID: 0716055
% Email Address: bpploabc@gmail.com
% Department: Computer Science
% Date: 2020/05/04
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show a message about the problem in the exercise/lab/midterm/exam
disp('Lab Problem 1.1')

M = imread('tmp.png');
MM = imresize(M,[640 640]);
I = MM;
s = size(I);
l = s(1);
[x y] = meshgrid(1:l/2);
r = ((x-l/4).^2.+(y-l/4).^2);
for i = 1:l/2
    for j = 1:l/2
        if r(i,j) >(l/4).^2
            r(i,j) = 0;
        else
            r(i,j) = 30;
        end
    end
end
rr = [r,r;r,r];
on = 0;
off = I;
while 1
    op = input('Please input op: ');
    if op == 1
        disp('0716055 ¤ýÄ£¼w');
        return;
    elseif op == 2
        figure(1);
        for i = 1:10:l
            clf;
            I(:, i:i+9, :) = I(:, i:i+9, :)+30-i*30/l;
            off(:, i:i+9, :) = off(:, i:i+9, :)+30-i*30/l;
            imshow(I);
            pause(0.00001);
        end
    elseif op == 3
        figure(1);
        for i = l-9:-10:1
            clf;
            I(:, i:i+9, :) = I(:, i:i+9, :)+30-(l-i)*30/l;
            off(:, i:i+9, :) = off(:, i:i+9, :)+30-(l-i)*30/l;
            imshow(I);
            pause(0.00001);
        end
    elseif op == 4
        figure(1);
        for i = 1:10:l
            clf;
            I(i:i+9, :, :) = I(i:i+9, :, :)+30-i*30/l;
            off(i:i+9, :, :) = off(i:i+9, :, :)+30-i*30/l;
            imshow(I);
            pause(0.00001);
        end
    elseif op == 5
        figure(1);
        for i = l-9:-10:1
            clf;
            I(i:i+9, :, :) = I(i:i+9, :, :)+30-(l-i)*30/l;
            off(i:i+9, :, :) = off(i:i+9, :, :)+30-(l-i)*30/l;
            imshow(I);
            pause(0.00001);
        end
    elseif op == 6
        figure(1);
        clf;
        if on == 0
            off = I;
            for i = 1:l
                for j = 1:l
                    I(i, j, :) = I(i, j, :)+rr(i,j);
                end
            end
            onn = I;
            imshow(I);
            on = 1;
        else
            I = off;
            imshow(I);
            on = 0;
        end
    end
end
















