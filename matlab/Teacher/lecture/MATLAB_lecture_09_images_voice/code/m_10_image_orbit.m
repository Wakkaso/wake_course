%increase blue and green intensity
close all;
I = imread('tmp.png');
s0 = size(I);
Id = im2double(I);
figure, imshow(I);
input('Press ENTER to start...');

numFrames = 500


for f = [1:numFrames]
    f0 = f/numFrames*pi*2;
    xx = 0.8*s0(2)*cos(f0)/2;
    yy = 0.8*s0(1)*sin(f0)/2;
    [x y] = meshgrid([1:s0(2)], [1:s0(1)]);
    x = (x-s0(2)/2+xx) ./30;
    y = (y-s0(1)/2+yy) ./ 30;
    r = sqrt(x.^2 + y.^2) + eps;
    z = abs(sin(r) ./r);
    zmax = max(max(z))
    z = 5.*z ./ zmax;
    K = cat(3, z, z, z);
    k0 = 0.5 + abs(0.5*(sin(f/20)));
    K1 = cat(3, k0.*Id(:,:,1).*K(:,:,1),...
           k0.*Id(:,:,2).*(2-K(:,:,1)),...
           k0.*Id(:,:,3).*(2-K(:,:,1)) );
    imshow(K1); pause(0.033);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%
