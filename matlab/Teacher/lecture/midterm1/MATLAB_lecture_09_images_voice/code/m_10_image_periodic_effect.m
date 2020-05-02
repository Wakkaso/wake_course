<<<<<<< HEAD
%increase blue and green intensity
close all;
I = imread('tmp.png');
s = size(I);
K = ones(size(I), 'double');
figure, imshow(I);
input('Press ENTER to start...');

numFrames = 500

for f = [1:numFrames]
Id = im2double(I);
i = 1;
rsin = sin(2*f/20);
rcos = cos(f/20);
rred = 0.5*rsin;
rbluegreen = 2.0*rcos;
while i < s(2)
    K(:,i,1) = rred*i/s(2);
    K(:,i,2:3) = rbluegreen*i/s(2);
    i = i + 1;
end
imshow(Id.*K);
pause(0.033);
end

x = [1:numFrames];
y1 = 0.5.*sin(2.*x/20);
y2 = 2.0.*cos(x./20);
figure
plot(x, y1, 'LineWidth', 3);
hold on
plot(x, y2, 'LineWidth', 3);
hold off
legend('0.5sin(2x/20)','2cos(x/20)')
%%%%%%%%%%%%%%%%%%%%%%%%%%%
=======
%increase blue and green intensity
close all;
I = imread('tmp.png');
s = size(I);
K = ones(size(I), 'double');
figure, imshow(I);
input('Press ENTER to start...');

numFrames = 500

for f = [1:numFrames]
Id = im2double(I);
i = 1;
rsin = sin(2*f/20);
rcos = cos(f/20);
rred = 0.5*rsin;
rbluegreen = 2.0*rcos;
while i < s(2)
    K(:,i,1) = rred*i/s(2);
    K(:,i,2:3) = rbluegreen*i/s(2);
    i = i + 1;
end
imshow(Id.*K);
pause(0.033);
end

x = [1:numFrames];
y1 = 0.5.*sin(2.*x/20);
y2 = 2.0.*cos(x./20);
figure
plot(x, y1, 'LineWidth', 3);
hold on
plot(x, y2, 'LineWidth', 3);
hold off
legend('0.5sin(2x/20)','2cos(x/20)')
%%%%%%%%%%%%%%%%%%%%%%%%%%%
>>>>>>> 542a0a8303d7514c52d858d6ed680356c059c9eb
