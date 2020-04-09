close all; clear; clf

x= -10:0.05:10;
y = sin(x);
y1 = cos(x);
figure
plot(x, y,'linewidth', 30, 'color', 'b');
hold on
plot(x, y1,'linewidth', 30, 'color', 'r');
set(gcf,'color','k');
set(gca,'visible','off');
saveas(gcf,'sin_02.jpg');


I = imread('sin_02.jpg');
figure, imshow(I);

I2 = I;
K = I2;
K = im2double(K);
K = imresize(K, [640 640]);
K1 = 1-K;
figure, imshow(K1)

L = imread('tmp.png');
figure, imshow(L);
L1 = im2double(L);
L1 = imresize(L1, [640 640]);
figure
imshow(L1.*K1);

figure
imshow(L1*(1- L1.*K1));

