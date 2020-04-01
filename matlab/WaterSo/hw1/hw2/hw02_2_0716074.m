%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 1
% Student Name: TSAI YU-CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: Computer Science, NCTU
% Date: 3/31
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
