%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 2
% Problem number: 3
% Student Name:  TSAI YU CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: CS
% Date: 5/21.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
                            		% clear variables, and clear screen

disp('Midterm Problem 2.3') 	% show Midterm Problem 2.1

disp('Student Name:TSAI YU CHENG ; Student ID: 0716074');
while(1)
    n = input('Input the number of points (must greater than 8): ');
    if n>8
        break;
    end
end
p = zeros(2000,2);
v = zeros(2000,2);

t = 0; 
v(1,:) = [-1  7];
p(1,:) = [50  3];
dt = 0.05;M = 10000; m= 1;  d = 0.01;
tmax=100;

i=1;
while t<tmax
%     t = t + 0.025;
    if i>1
        v(i,:)=v(i-1,:);
        p(i,:)=p(i-1,:);            
    end

    F = - p(i,:).*m.*M ./ (norm(p(i,:)) .* (norm(p(i,:)).^2) );
    a = F ./ m - d.*v(i,:).*abs(2.*sin(t));
    v(i,:) = v(i,:) + a .* dt;
    p(i,:) = p(i,:) + v(i,:) .* dt;

    t = t + dt;

    i=i+1;
end
figure;
num=[];
sd=[];
for i=1:2000-n
    clf;
    subplot(1,2,1);
    plot(p(i:i+n,1),p(i:i+n,2),'.b');
    hold on;
    plot(p(1:i+n,1),p(1:i+n,2),'-g');
    axis([-10 50 -30 30]);
    
    subplot(1,2,2);
    dp = p(i+1:i+n, :) - p(i:i+n-1,:);
    d2 = dp(:,1).*dp(:,1) + dp(:,2).*dp(:,2);
    d1 = sqrt(d2);
    sd = [sd sum(d1)];	% total length
    num = [num i];
    plot(num,sd,'linewidth',1);
    pause(0.001);
    
end
