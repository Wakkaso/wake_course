close all; clf; clear; clc;

% show Lab
disp('Lab')  
I = imread('tmp.png');

Id = im2double(I);

s = size(Id);
w = s(2);
h = s(1);
%meshgrid version
%{

x= [1:w];
fx = abs(cos(x./w.*2.*pi));
y= [1:h];
fy = abs(cos(x./h.*2.*pi));

[x y] = meshgrid(fx, fy);

op = input('input op: ');

if op == 0
    return;
elseif op == 1
    Id = Id.*fx;
elseif op == 2
    Id = Id.*fy;
end
imshow(Id);
%}

op = input('input op: ');

if op == 0
    return;
elseif op == 1
    x= [1:w];
    fx = abs(cos(x./w.*2.*pi));
    for i = x
        clf;
        Id(:, i, :) = Id(:, i, :).*fx(i).*(i/w*2+1);
        imshow(Id);
        pause(0.00003);
    end
    
elseif op == 2
    x= [1:h];
    fx = abs(cos(x./h.*2.*pi));
    for i = x
        clf;
        Id(i, :, :) = Id(i, :, :).*fx(i).*(i/h*2+1);
        imshow(Id);
        pause(0.00003);
    end
    
end


        