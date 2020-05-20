%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab
% Problem number: 2
% Student Name:  TSAI YU CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: Computer Science, NCTU
% Date: 5/8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clf; clear; clc;		

disp('Assignment Problem 3.2') 	% show Assignment Problem 3.2
T = 0 : 0.01 : 2*pi; 
R = cos(2.*T) .* sin(2.*T);
i = 1;
for t0 = T
    k=0:1;
    R0 = k.* R(1,i)./1 ;
    x = R0 .* cos(T(1,i));
    y = R0 .* sin(T(1,i));
    [theta,rho] = cart2pol(x,y);
    if(i>1)
    polarplot(last_t,last_r,'LineWidth',2,'Color','y');
    end
    last_t=theta;
    last_r=rho;
    polarplot(theta,rho,'LineWidth',2,'Color','b'); 
    polarplot(T(1:i),R(1:i),'LineWidth',2,'Color','b');
    
    hold on;     
    pause(0.001);
    i = i + 1;
end