%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 4
% Problem number: 1
% Student Name:  TSAI YU CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/5/31
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;
% show ???
disp('Problem 4.1');

while 1
    n = input('Input number of sample: ');
    if(n==0)
        return;
    end
    In = input('Input a, b, and c [a, b, c]: ');
    a= In(1);b= In(2);c= In(3);
    while(1)
        if(a>0&&b>0&&c>0||a<0&&b<0&&c<0)
            break;
        end
        disp('Invalid input.');
        return;
    end

    clf;
    count = 0;
    Y = rand(1,n);
    X = a.*Y.^2+b.*Y+c;
    % solve-> 
    %  CDF = -(b + (b^2 + 4*X*a - 4*a*c)^(1/2))/(2*a)

    
    M= mean(X); 
    SD= std(X);
    x0 = min(X):0.001:max(X);
    F = 1./(b^2 + 4.*x0.*a - 4*a*c).^(1/2);
    
    for i = max(X):-0.01:min(X)
        clf;
        histogram(X,'Normalization','pdf');
        hold on;
        t1 = sprintf('M: %f; SD: %f; a= %f; b= %f; c= %f; ',M,SD,a,b,c);
        title({t1});
        plot(x0,F,'LineWidth',3);
        f = 1./(b^2 + 4*i*a - 4*a*c)^(1/2);
        plot(i,f,'.','Markersize',20);
        pause(0.001)
        
    end
end