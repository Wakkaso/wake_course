%increase blue and green intensity
close all;
I = imread('tmp.png');
I1 = imresize(I, [640, 640]);
s0 = size(I);
Id = im2double(I1);
s1 = size(Id);
K = ones(size(Id), 'double');
figure, imshow(I);
input('Press ENTER to start...');

numFrames = 500

[x y] = meshgrid([1:s1(2)]);
x = (x-s1(2)/2) ./30;
y = (y-s1(2)/2) ./ 30;
r = sqrt(x.^2 + y.^2) + eps;
z = abs(sin(r) ./r);
zmax = max(max(z))
z = 5.*z ./ zmax;
K = Id;
K(:,:,1) = z(:,:);
K(:,:,2) = z(:,:);
K(:,:,3) = z(:,:);
for f = [1:numFrames]
    k0 = 0.5 + 0.5*(sin(f/20));
    K1 = Id;
    K1(:,:,1) = k0.*Id(:,:,1).*K(:,:,1);
    K1(:,:,2) = k0.*Id(:,:,2).*(2-K(:,:,1));
    K1(:,:,3) = k0.*Id(:,:,3).*(2-K(:,:,1));
    K1 = imresize(K1, [s0(1) s0(2)]);
    imshow(K1);
    pause(0.033);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
