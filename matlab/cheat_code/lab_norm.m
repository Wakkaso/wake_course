%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: ¡K
% Problem number: ¡K
% Student Name:  ¡K
% Student ID: ¡K
% Email address: ¡K
% Department: Computer Science, NCTU
% Date: ¡K.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;
disp('problem 1.1');


c = -1; sigma = 3; r1 = 2.5; r2 = 3.5;
y = str2sym('2.718281828^(-(x-1)^2/8)');
A = int(y,'x', r1, r2);

n = 1000; j = 1;
a = zeros(n,1);
while (j<=n)
    x = r1 + (r2-r1)*rand(1);
    p  = gaussmf(x, [sigma, c])/A;
    r = x*p*(r2-r1);
    fprintf('%f',j);
    a(j,1) = r;
    j = j +1;
end
fprintf('%f',mean(a));

% 
% n = 1000; j = 1; r1 = 2.5; r2 = 3.5;
% c = -1; sigma = 3;
% y = str2sym('2.718281828^(-(x+1)^2/18)');
% A = int(y,'x', r1, r2);
% 
% 
% a = zeros(1, n);
% 
% x0 = -9:0.01:7;
% y0 = 2.718281828.^(-(x0+1).^2./18);
% figure(1);
% plot(x0, y0);
% hold on;
% x1 = 2.5:1/n:3.5;
% y1 = 2.718281828.^(-(x1+1).^2./18);
% x1 = [x1 r2];
% y1 = [y1 0];
% x1 = [x1 r1];
% y1 = [y1 0];
% fill(x1, y1, 'b');
% axis([-10 8 0 1]);
% 
% j = 1;
% a = [];
% b = [];
% c = [];
% tic
% sum1=0;sum2=0;sum3=0;
% sqr1=0;sqr2=0;sqr3=0;
% while j <= 1000
%     t = normrnd(-1,3);
%     if t>=2.5 && t<=3.5
%         sum1=sum1+t;
%         sqr1=sqr1+t^2;
%         j = j+1;
% 
%     end
% end
% j = 1;
% while j <= 100000
%     t = normrnd(-1,3);
%     if t>=2.5 && t<=3.5
%         sum2=sum2+t;
%         sqr2=sqr2+t^2;
%         j = j+1;
% 
%     end
% end
% j = 1;
% while j <= 1000000
%     t = normrnd(-1,3);
%     if t>=2.5 && t<=3.5
%         sum3=sum3+t;
%         sqr3=sqr3+t^2;
%         j = j+1;
%     end
% end
% toc
% m1 = sum1/1000;
% m2 = sum2/100000;
% m3 = sum3/1000000;
% 
% s1 = sqrt(sqr1/1000-m1^2);
% s2 = sqrt(sqr2/100000-m2^2);
% s3 = sqrt(sqr3/1000000-m3^2);
% 
% t1 = sprintf('n=1000; mean=%f; SD: %f;',m1,s1);
% t2 = sprintf('n=100000; mean=%f; SD: %f;',m2,s2);
% t3 = sprintf('n=1000000; mean=%f; SD: %f;',m3,s3);
% 
% title({t1; t2; t3});
%         
% 
% clf;clear;clc;
% disp('problem 1.2');
% 
% 
% x = 0:0.05:2*pi;
% x0 = [];
% for i = x
%     clf;
%     x0 = [x0 i];
%     y1 = sin(x0);
%     y2 = cos(2*x0);
%     plot(x0, y1, 'linewidth', 3);
%     hold on;
%     plot(x0, y2, 'linewidth', 3);
%     hold on;
%     x1 = [x0 fliplr(x0)];
%     yy = [y1 fliplr(y2)];
%     fill(x1, yy, 'y');
%     title('y1(x) = sin(x) and y2 = cos(2x).');
%     legend({'y1(x)', 'y2(x)', 'region'});
%     xlabel('x');
%     ylabel('y');
%     axis([0 2*pi -1 1]);
%     pause(0.033);
% end

