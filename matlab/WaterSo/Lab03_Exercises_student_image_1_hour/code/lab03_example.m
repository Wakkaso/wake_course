%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab
% Problem number: …
% Student Name:  …
% Student ID: …
% Email address: …
% Department: Computer Science, NCTU
% Date: ….
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
Id(1:10,:, 1) = 0;
Id(1:10,:, 2) = 1.0;
Id(1:10,:, 3) = 0;

Id((h-10):h,:, 1) = 0;
Id((h-10):h,:, 2) = 1.0;
Id((h-10):h,:, 3) = 0;

Id(:,1:10, 1) = 0;
Id(:,1:10, 2) = 1.0;
Id(:,1:10, 3) = 0;

Id(:,(w-10):w, 1) = 0;
Id(:,(w-10):w, 2) = 1.0;
Id(:,(w-10):w, 3) = 0;

imshow(Id);

