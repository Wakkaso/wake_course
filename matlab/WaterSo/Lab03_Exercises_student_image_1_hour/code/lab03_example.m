%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab
% Problem number: ?
% Student Name:  ?
% Student ID: ?
% Email address: ?
% Department: Computer Science, NCTU
% Date: ?.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show Lab
disp('Lab')  


I = imread('tmp.png');

Id = im2double(I);

s = size(Id);
w = s(2);
h = s(1);
x=(1:w);
y=(1:h);

fx = 2.*abs(cos(x./w.*2.*pi));
fy = 2.*abs(cos(y./h.*2.*pi));
[x, y] = meshgrid(fx,fy);

op = input("Input op: ");
if op == 0
    return;
elseif op == 1
    Id = Id.*x;
elseif op == 2
    Id = Id.*y;
end
imshow(Id);


