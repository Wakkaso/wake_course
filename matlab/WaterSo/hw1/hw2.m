%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 1
% Student Name: TSAI YU-CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: Computer Science, NCTU
% Date: 3/31
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clf; clear; clc;
disp('problem 1');
clf; clear; clc;
fprintf('Student ID:0716074  Name:TSAI YU-CHENG\n');
x=-10:0.05:10;
while 1
	coef = input('Please input the coefficients [a0,b0]:');
    if coef(1)&&coef(2)==0 
        fprintf('Thanks for playing.\n');
        break;
    end
    
    clf;
    a0 = coef(1); b0 = coef(2);
	
    for a=(a0-10:a0+10)
        for b=(b0-10:b0+10)
            y = a.*sin(x)+b.*cos(x);
            plot(x,y);
            hold on;
        end
    end
    break;
	
end


clf; clear; clc;
disp('problem 2');
clf; clear; clc;
fprintf('Student ID:0716074  Name:TSAI YU-CHENG\n');
x=-10:0.05:10;
while 1
	coef1 = input('Please input the range of a [aMin,aMax]:');
    coef2= input('Please input the step size, da of a:');
    da = coef2(1);
    if da==0
        fprintf('Thanks for playing.\n');
        break;
    end
    
    clf;
    aMin = coef1(1); aMax = coef1(2);
    
	
    for a=(aMin:da:aMax)
        y = abs(sin(a.*x).*cos(x));
        plot(x,y,'LineWidth',2);
        hold on;
    end
    
	
end


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

clf; clear; clc;
disp('problem 4');
clf; clear; clc;
fprintf('Student ID:0716074  Name:TSAI YU-CHENG\n');
clf
x = -5:0.005:10;
y = (5.*x.^2+2.*x+7)./(x.^2-5.*x-14);
plot(x, y,'-r','Linewidth', 2);
hold on;
i1 = find(y<0);
y1 = y(i1);
x1 = x(i1);
hold on
plot(x1, y1,'-b','Linewidth', 2);


