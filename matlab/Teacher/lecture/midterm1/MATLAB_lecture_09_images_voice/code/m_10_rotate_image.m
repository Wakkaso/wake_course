<<<<<<< HEAD
%I = imread('C:\Users\Wingo\Desktop\PresentationCD\MATLAB_lecture_09\code\tmp.png');
I = imread('tmp.png');

C = imresize(I, [500, 500], 'nearest'); 
D = imresize(I, [500, 300], 'bilinear'); 
E = imresize(I, [500, 250], 'bicubic'); 
figure, imshow(C), figure, imshow(D), figure, imshow(E)

%Do animation
close all
h1 = figure(1)
set(h1,'Position',[10 10 500 500])
I1 = imresize(I, [ 500 500]);
imshow(I1);
input('Press Enter to start...');
i = 0;
while i <= 360
F = imrotate(I,i*1);
%I1 = imresize(F, [ 500 500]); % no resize
I1 = F;
imshow(I1);
%set(h1,'Position',[10 10 500 500])
i = i + 1;
pause(0.0333)
=======
%I = imread('C:\Users\Wingo\Desktop\PresentationCD\MATLAB_lecture_09\code\tmp.png');
I = imread('tmp.png');

C = imresize(I, [500, 500], 'nearest'); 
D = imresize(I, [500, 300], 'bilinear'); 
E = imresize(I, [500, 250], 'bicubic'); 
figure, imshow(C), figure, imshow(D), figure, imshow(E)

%Do animation
close all
h1 = figure(1)
set(h1,'Position',[10 10 500 500])
I1 = imresize(I, [ 500 500]);
imshow(I1);
input('Press Enter to start...');
i = 0;
while i <= 360
F = imrotate(I,i*1);
%I1 = imresize(F, [ 500 500]); % no resize
I1 = F;
imshow(I1);
%set(h1,'Position',[10 10 500 500])
i = i + 1;
pause(0.0333)
>>>>>>> 542a0a8303d7514c52d858d6ed680356c059c9eb
end