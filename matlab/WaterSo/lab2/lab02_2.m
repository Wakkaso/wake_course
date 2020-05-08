%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem Category: lab02
% Problem Number: 2
% Student Name:  wupeii
% Student ID: 0816021
% Email Address: wupeii0102.cs08@nctu.edu.tw
% Department: CS
% Date: 2020/5/9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
clf; clear; clc; close all;

% show a message about the problem in the exercise/lab/midterm/exam
disp('Lab 2.2')  

n = input('Number of particles in [0,300]: ');
if n == 0
    disp('0716074');
    return;
end
fprintf("This system generates %d particles.  Enjoy the simulation.",n);

M = 10000; m = 1; t = 0;

p = zeros(n,2);
pd = zeros(n,1);
for k = 1 : n
    while 1
        p(k,:) = (rand(1,2)*100) - 50;  % -50~50
        pd(k) = (p(k,1)^2 + p(k,2)^2) ^ (1/2);  % ||p||
        if pd(k) <= 50 && pd(k) >= 10
            break;
        end
    end
end

while 1
    v = 20 * [p(:,2) -p(:,1)] ./ pd;

    F = - p.*m.*M ./ ( pd .* (1+p.^2) );
    a = F ./ m;
    v = v + a .* 0.025;
    p = p + v .* 0.025;
    t = t + 0.025;
    for pk=1:n
        cp0 = [ 0 0 1];  % blue
        cp1 = [ 1 0 0];  % red
        vD = min(1, pd(pk,:)/50);
        p_color  = cp0 + vD.*(cp1-cp0);
        plot(p(pk,1),p(pk,2),'o','color',p_color);
        hold on;
        axis equal square manual;
    end
end



