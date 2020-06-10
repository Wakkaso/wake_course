close all; clf; clear; clc;

% show Lab
disp('Lab')  


I = imread('tmp.png');

Id = im2double(I);

s = size(Id);
w = s(2);
h = s(1);

opt = input('input opt: ');
if opt == 0
    disp('Thanks for playing.');
    return;
end

step = 1;
while step < w
    Id(:, (step):(step+4), 1) = 0;
    Id(:, (step):(step+4), 2) = 0;
    Id(:, (step):(step+4), 3) = 1.0;
    step = step + w/8;
end
Id(:, w-5:w, 1) = 0;
Id(:, w-5:w, 2) = 0;
Id(:, w-5:w, 3) = 1.0;

if opt == 1
    Id(1:5,:, 1) = 0;
    Id(1:5,:, 2) = 0;
    Id(1:5,:, 3) = 1.0;
    
    Id((h/2-2):(h/2+2),:, 1) = 0;
    Id((h/2-2):(h/2+2),:, 2) = 0;
    Id((h/2-2):(h/2+2),:, 3) = 1.0;
    
    Id((h-5):h,:, 1) = 0;
    Id((h-5):h,:, 2) = 0;
    Id((h-5):h,:, 3) = 1.0;
elseif opt == 2
    step = 1;
    while step < h
        Id((step):(step+4), :, 1) = 0;
        Id((step):(step+4), :, 2) = 0;
        Id((step):(step+4), :, 3) = 1.0;
        step = step + h/4;
    end
    Id(h-5:h, :, 1) = 0;
    Id(h-5:h, :, 2) = 0;
    Id(h-5:h, :, 3) = 1.0;
elseif opt == 3
    step = 1;
    while step < h
        Id((step):(step+4), :, 1) = 0;
        Id((step):(step+4), :, 2) = 0;
        Id((step):(step+4), :, 3) = 1.0;
        step = step + h/8;
    end
    Id(h-5:h, :, 1) = 0;
    Id(h-5:h, :, 2) = 0;
    Id(h-5:h, :, 3) = 1.0;
else
end

imshow(Id);

