tic
clear; close all;
c = 0; N = 20000000;
%n = [];
n = zeros(1, N);
while c < N
    x = 0;
while ~((0.5 <=x && x <= 0.8) ||... 
        (0.2 <=x && x <= 0.4) )
   x = rand(1);
end
%n = [n x];
c = c + 1;
n(c) = x;
end

b0 = sum(0.2 <=n & n <= 0.4);
b1 = sum(0.5 <=n & n <= 0.8);
fprintf('# in bin 0:%d\n', b0);
fprintf('# in bin 1:%d\n', b1);
toc