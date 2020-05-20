%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem Category: ? exercise/lab/midterm/exam
% Problem Number: ?
% Student Name:  ?
% Student ID: ?
% Email Address: ?
% Department: ?
% Date: ?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show a message about the problem in the exercise/lab/midterm/exam
disp('Lab Problem 1.1')

n = input('input n: ');
if n==0
    disp('0716055')
    return;
end
fprintf('This system generates %d particles. Enjoy the simulation.\n', n);

t = 0;
dt = 0.025;
m = 1;
M = 10000;
p = [];
s = rng;
while size(p,1)<n
    r = randi([-50 50],1,2);
    dis = sqrt(r(1).^2+r(2).^2);
    if dis>10 && dis<50
        p = [p;r];
    end
end
v1 = 20 .* [p(:,2), -p(:,1)]./sqrt(p(:,1).^2+p(:,2).^2);
v2 = 20 .* [-p(:,2), p(:,1)]./sqrt(p(:,1).^2+p(:,2).^2);
v = [v1(1:n/2,:);v2(n/2+1:n,:)];



while 1
    clf;
    dis = sqrt(p(:,1).^2+p(:,2).^2);

    cp0 = [ 0 0 1];
    cp1 = [ 1 0 0];
    vD = min(1, dis./50);
    particle_color  = cp0 + vD*(cp1-cp0);
    scatter(p(:,1),p(:,2),[] ,particle_color, 'linewidth', 3);
    axis([-80 80 -80 80]);
    pbaspect([1 1 1]);
    F = -p./sqrt(p(:,1).^2+p(:,2).^2).*m.*M./(1+p.^2);
    a = F./m;
    v = v + a.*dt;
    p = p + v.*dt;
    t = t+dt;
    pause(0.033);
end






