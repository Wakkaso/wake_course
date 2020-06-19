%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 3
% Problem number: 1
% Student Name:  Chris Wang
% Student ID: 0716055
% Email address: bpploabc@gmail.com
% Department: CS
% Date: 2020/6/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Align the lines
% Select all and then press CONTROL-I
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
% clear variables, and clear screen

disp('Final Exam Problem 1.1') 	% show Final Exam Problem 1.1

disp('0716055; Chris Wang');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Align the lines
% Select all (CONTROL-A) and then press CONTROL-I
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global key_pressed_op_1;
        global key_pressed_op_2;
                global key_pressed_op_3;
global key_pressed_quit;

key_pressed_op_1 = false;
        key_pressed_op_2 = false;
key_pressed_op_3 = false;
        key_pressed_quit = false;

h_fig = figure;

set(h_fig,'KeyPressFcn',...
    @m_KeyCallBack_curve); % callback function



b = 15;
a = 1;
c = 4;
x = -20:0.005:20;
y = (a.*x.^2+c.*x.*sin(x)-11)./(x.^2-b.*x-16);
x1 = -20:0.005:b/2-sqrt(b.^2+64)/2;
x2 = b/2-sqrt(b.^2+64)/2+eps:0.005:b/2+sqrt(b.^2+64)/2+eps;
x3 = b/2+sqrt(b.^2+64)/2+eps:0.005:20;
y1 = (a.*x1.^2+c.*x1.*sin(x1)-11)./(x1.^2-b.*x1-16);
y2 = (a.*x2.^2+c.*x2.*sin(x2)-11)./(x2.^2-b.*x2-16);
y3 = (a.*x3.^2+c.*x3.*sin(x3)-11)./(x3.^2-b.*x3-16);
plot(x1, y1, 'linewidth',3);
hold on;
plot(x2, y2, 'linewidth',3);
hold on;
plot(x3, y3, 'linewidth',3);
hold on;

        tit = sprintf('b=%f',b);
        title(tit);
axis([-20 20 -10 10]);

while true
    
    if (key_pressed_op_1) 
        key_pressed_op_1 = false;
        b = b-1;
    end
    
    if (key_pressed_op_2) 
        key_pressed_op_2 = false;
        b = b+1;
    end
    
    if (key_pressed_op_3) 
        key_pressed_op_3 = false;
        clf;
    end
    
    if (key_pressed_quit) 
        key_pressed_quit = false;
        
        disp('Student ID: 0716055');
        return;
    end
    
        x = -20:0.005:20;
        y = (a.*x.^2+c.*x.*sin(x)-11)./(x.^2-b.*x-16);
        if b.^2+64>0
            x1 = -20:0.005:b/2-sqrt(b.^2+64)/2-0.01;
            x2 = b/2-sqrt(b.^2+64)/2+0.01:0.005:b/2+sqrt(b.^2+64)/2-0.01;
            x3 = b/2+sqrt(b.^2+64)/2+0.01:0.005:20;
            
            y1 = (a.*x1.^2+c.*x1.*sin(x1)-11)./(x1.^2-b.*x1-16);
            y2 = (a.*x2.^2+c.*x2.*sin(x2)-11)./(x2.^2-b.*x2-16);
            y3 = (a.*x3.^2+c.*x3.*sin(x3)-11)./(x3.^2-b.*x3-16);
            plot(x1, y1, 'linewidth',3);
            hold on;
            plot(x2, y2, 'linewidth',3);
            hold on;
            plot(x3, y3, 'linewidth',3);
            hold on;
            tit = sprintf('b=%f',b);
            title(tit);
            axis([-20 20 -10 10]);
        elseif b.^2+64<eps
            x1 = -20:0.005:b/2-eps;
            
            x3 = b/2+eps:0.005:20;
            y1 = (a.*x1.^2+c.*x1.*sin(x1)-11)./(x1.^2-b.*x1-16);
            
            y3 = (a.*x3.^2+c.*x3.*sin(x3)-11)./(x3.^2-b.*x3-16);
            plot(x1, y1, 'linewidth',3);
            hold on;
            plot(x3, y3, 'linewidth',3);
            hold on;
            tit = sprintf('b=%f',b);
            title(tit);
            axis([-20 20 -10 10]);
        else
        end
    
    pause( 0.033);

end
