%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: ¡K
% Problem number: ¡K
% Student Name:  ¡K
% Student ID: ¡K
% Email address: ¡K
% Department:
% Date: ¡K.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all; clear; clc;	
disp('Exam Problem 1.1');
disp('id: 0716055');
disp('Name: ¤ýÄ£¼w');
op = input('Menu\nOption 1)\nOption 2)\nOption 3)\nPlease enter the option: ');

if op == 1
    x = -10:0.01:10;
    for w = [1:12 12:-1:1 1:12 12:-1:1 1:12]
        am = w/4-1/4;
        y = sin(x);
        clf;
        c = 1;
        for lw = [1:6 6:-1:1]
            plot(x, (-1)^(c+1).*y.*am+c, 'linewidth', lw);
            axis([-10 10 -5 15]);
            hold on;
            c = c+1;
        end
        pause(0.01);
    end
elseif op == 2
    x = -10:0.01:10;
    for w = [12:-1:1 1:12 12:-1:1 1:12 12:-1:1 1:12]
        am = w/20;
        y = sin(x.*(1+w/2));
        clf;
        c = 0;
        for lw = [1:6 6:-1:1]
            plot(x, (-1)^(c+1).*y.*am+c, 'linewidth', lw);
            axis([-10 10 -5 15]);
            hold on;
            c = c+1;
        end
        pause(0.01);
    end
elseif op == 3
    I = imread('tmp.png');
    I2 = im2double(I);
    size(I2)
    s = zeros(525,791)-0.3;
    h = 791;
    w = 525;
    [x y] = meshgrid(w,h);
    r1 = 50;
    r2 = 60;
    dd = r1*1.8;
    ref = [w/2 h/2];
    C = [ref; ref-[0 dd]; ref+[0 dd]; ref-[-dd/2 dd/2]; ref-[-dd/2 -dd/2]]
    for idx = 1:5
        for i = 1:w
            for j = 1:h
                if 50<sqrt((i-C(idx,1)).^2+(j-C(idx,2)).^2) && sqrt((i-C(idx,1)).^2+(j-C(idx,2)).^2)<60
                    s(i,j) = 0.3;
                end
            end
        end
    end
    
    imshow(I2+s);
end
            
