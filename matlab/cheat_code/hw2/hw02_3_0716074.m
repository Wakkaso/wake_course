%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 1
% Student Name: TSAI YU-CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: Computer Science, NCTU
% Date: 3/31
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clf; clear; clc;
disp('problem 3');
clf; clear; clc;
fprintf('Student ID:0716074  Name:TSAI YU-CHENG\n');
while 1
    coef = input('Please input m. m  is an integer inside [-1, 10]: ');
    m=coef;
    if(m>10||m<-1)
        fprintf('error,please input again.\n');
        continue;
    end
   

    if m==-1
        fprintf('Thanks for playing.\n');
        break;
    end
    clf;
    ylim([-1.5, 1.5]);
    x=-5:0.01:5;
    y1 = sin(x);
    plot(x,y1,'LineWidth',4);
    hold on;
    for n=0:m
        syms k;
        y2 = symsum(((-1)^k)*(x.^(2*k+1))./(factorial(2*k+1)),0,n);
        plot(x,y2,'LineWidth',1);
        hold on;
    end
    ylim([-1.5, 1.5]);
end