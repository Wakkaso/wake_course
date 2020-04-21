% Basic
I = imread('tmp.png');
figure;
imshow(I);
whos I;
figure;clf;
imhist(I);	%create a histogram 

% improve image contrast
I2 = histeq(I); 
figure ;
imshow(I2);
imhist(I2);	 %create a histogram 


imwrite (I2, 'southside.png');
imfinfo('southside.png')

size(I)% get the dimension of an image I

% gray
I = imread('tmp.png');
B = rgb2gray(I);
figure;
imshow(B);

% resize
C = imresize(I, [500, 500], 'nearest');
D = imresize(I, [500, 300], 'bilinear');
E = imresize(I, [500, 250], 'bicubic');
figure, imshow(C), figure, imshow(D), figure, imshow(E);

% rotate
close all; 
h1 = figure(1);
set(h1,'Position',[10 10 500 500]);  % (10,10): position of upper left corner
I1 = imresize(I, [ 500 500]);
imshow(I1);
input('Press Enter to start...');
i = 0;
% while i <= 360
%    F = imrotate(I,i*1);
%    I1 = imresize(F, [ 500 500]);  %no resize
%    imshow(I1);	
%    i = i + 1; pause(0.0001)
% end
close all;
% color slowly change(JAM TSUN)
x = size(I);
I2 = I;
for i = [1:x(1)]
    f = i/x(1);
%     for j = [1:x(2)]
% %       v = sum( I2(i,j,:) )/3;
% %       I2( i,j,: ) = v;

%         I2(i,j,1) = I(i,j,1);
%         I2(i,j,2) = I(i,j,2);
%         I2(i,j,3) = I(i,j,3)*f;
%     end
    I2(i,:,:) = I(i,:,:)*f;
end
imshow(I2);
% 0>>2.5>>0
x = size(I);
I2 = I;
for i = [1:x(2)]
    if (i < x(2)/2)
        f = i/x(2)*5;
    else
        f = 5
        i/x(2)*5;
    end
    I2(:,i,:) = I(:,i,:)*f;
end
imshow(I2);

%   K(:) = 0;  %black
%   K(:) = 128;  %gray
%   K = ones(size(I), 'double'); %white


%   Black-white slowly change color
I = imread('tmp.png'); close all;
K = ones(size(I), 'double'); s = size(K); i = 1;
Id = im2double(I); 
while i <= s(2)
% %   another choice
%     K(:,i,1) = 1.5*i/s(2); 
%     K(:,i,2:3) = i/s(2); 

    K(:,i,1:3) = i/s(2);     
    i = i + 1;
end
figure, imshow(Id.*K);

% % Periodic effect(change color)
% % increase blue and green intensity
% close all;  I = imread('tmp.png'); 
% s = size(I); K = ones(size(I), 'double');
% figure, imshow(I);
% input('Press ENTER to start...');
% numFrames = 500;
% for f = [1:numFrames]
%     Id = im2double(I);
%     i = 1;
%     rsin = sin(2*f/20); 
%     rcos = cos(f/20);
%     rred = 0.5*rsin; 
%     rbluegreen = 2.0*rcos;
%     while i < s(2)
%         K(:,i,1) = rred*i/s(2);
%         K(:,i,2:3) = rbluegreen*i/s(2);
%         i = i + 1;
%     end
%     imshow(Id.*K);
%     pause(0.033);
% end


% % Periodic effect(circle)
% close all;
% I = imread('tmp.png');
% I = imresize(I, [640, 640]);
% s = size(I);
% Id = im2double(I);
% K = ones(size(I), 'double');
% figure, imshow(I);
% input('Press ENTER to start...');
% numFrames = 500;
% 
% [x y] = meshgrid([1:s(2)]);
% x = (x - s(1)/2) ./ 30;
% y = (y - s(2)/2) ./ 30;
% r = sqrt(x.^2 + y.^2) + eps;
% z = abs(sin(r) ./r); % Maxican hat
% zmax = max(max(z))
% z = 5.*z ./ zmax;
% K = Id;
% for i = 1:s(1)
%     for j = 1:s(2)
%       K(i,j,:) = z(i,j); % construct a mask
%     end
% end
% for f = [1:numFrames]
%     k0 = 0.5 + 0.5*(sin(f/20));
%     imshow(k0.*Id.*K);
%     pause(0.033);
% end




% % Periodic effect: Channel Controls
% close all;
% I = imread('tmp.png');
% I1 = imresize(I, [640, 640]);
% s0 = size(I); 
% Id = im2double(I1);
% s1 = size(Id);
% K = ones(size(Id), 'double');
% figure, imshow(I);
% input('Press ENTER to start...');
% numFrames = 500;
% [x y] = meshgrid([1:s1(2)]);
% x = (x-s1(1)/2) ./ 30;
% y = (y-s1(2)/2) ./ 30;
% r = sqrt(x.^2 + y.^2) + eps;
% 
% z = abs(sin(r) ./r);
% zmax = max(max(z))
% z = 5.*z ./ zmax;
% K = zeros(size(Id)); //initialize the mask
% K(:,:,1) = z(:,:); // construct a mask
% K(:,:,2) = z(:,:);
% K(:,:,3) = z(:,:);
% for f = [1:numFrames]
%     k0 = 0.5 + 0.5*(sin(f/20));
%     K1 = Id;
%     K1(:,:,1) = k0.*Id(:,:,1).*K(:,:,1);
%     K1(:,:,2) = k0.*Id(:,:,2).*(2-K(:,:,1));
%     K1(:,:,3) = k0.*Id(:,:,3).*(2-K(:,:,1));
%     K1 = imresize(K1, [s0(1) s0(2)]);
%     imshow(K1);
%     pause(0.033);
% end


% % Periodic effect: Orbit
% close all;
% I = imread('tmp.png');
% s0 = size(I);
% Id = im2double(I);
% figure, imshow(I);
% input('Press ENTER to start...');
% 
% numFrames = 500
% 
% for f = [1:numFrames]
%     f0 = f/numFrames*pi*2;
%     xx = 0.8*s0(2)*cos(f0)/2;
%     yy = 0.8*s0(1)*sin(f0)/2;
%     [x y] = meshgrid([1:s0(2)], [1:s0(1)]);
%     x = (x-s0(2)/2+xx) ./30;
%     y = (y-s0(1)/2+yy) ./ 30;
%     r = sqrt(x.^2 + y.^2) + eps;
%     z = abs(sin(r) ./r);
%     zmax = max(max(z))
%     z = 5.*z ./ zmax;
%     K = cat(3, z, z, z);
%     k0 = 0.5 + abs(0.5*(sin(f/20)));
%     K1 = cat(3, k0.*Id(:,:,1).*K(:,:,1),...
%            k0.*Id(:,:,2).*(2-K(:,:,1)),...
%            k0.*Id(:,:,3).*(2-K(:,:,1)) );
%     imshow(K1); pause(0.033);
% end
 
% Edge Detection(sobel & canny)
[~, threshold] = edge(G, 'sobel');
fudgeFactor = .5;
BWs = edge(G,'sobel', threshold * fudgeFactor);
figure, imshow(BWs), title('binary gradient mask');

% Edge + Image
G = rgb2gray(K1);
[~, threshold] = edge(G, 'canny');
fudgeFactor = .5;
BWs = edge(G,'canny', ¡K
threshold * fudgeFactor);
K2 = K1.*BWs;
imshow(K2 + K1)


% add noise
G = imnoise(I,'salt & pepper',0.1); % 
Imshow(G);

% Detect and Measure Circular Objects in an Image
rgb = imread('coloredChips.png'); 
imshow(rgb)
d = imdistline;
delete(d)  %delete the tool
gray_image = rgb2gray(rgb);
imshow(gray_image)

[centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark')


