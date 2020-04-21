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

