close all;
I = imread('tmp.png');
K = I;
%K = ones(size(I), 'double');    %white
%K(:) = 0;                      %black
%K(:) = 128;                    %gray
%K(:,:,[1:3]) = [128 128 0];
%K(:,i,1:3) = 64;
figure, imshow(I);
figure, imshow(K);

%blend with a gradient map
close all
s = size(K);
K = ones(size(I), 'double');
Id = im2double(I);
i = 1;
while i < s(2)
    K(:,i,1:3) = i/s(2);
    i = i + 1;
end
figure, imshow(Id.*K);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%increase red intensity
close all
s = size(K);
K = ones(size(I), 'double');

Id = im2double(I);

i = 1;
while i < s(2)
    K(:,i,1) = 2*i/s(2);
    K(:,i,2:3) = 0.5*i/s(2);
    i = i + 1;
end
figure, imshow(Id.*K);
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%increase blue intensity
close all
s = size(K);
K = ones(size(I), 'double');

Id = im2double(I);

i = 1;
while i < s(2)
    K(:,i,1) = 0.5*i/s(2);
    K(:,i,2:3) = 2*i/s(2);
    i = i + 1;
end
figure, imshow(Id.*K);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
