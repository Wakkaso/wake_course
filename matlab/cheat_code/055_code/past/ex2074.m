%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: 1
% Problem number: 2
% Student Name:  
% Student ID: 
% Email address: 
% Department: CS
% Date: 2020/06/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clf; clc; close all;    % close all windows
                            % clear variables, and clear screen

disp('Final Exam Problem 1.1')   % show Problem Number

disp('Student Name: TSAI');
disp('Student ID: 0716074');

disp('Menu');
disp('Option 1)');
disp('Option 2)');
disp('Option 3)');
op = input('Please enter the option: ');

x = -10 : 0.01 : 10;
switch op
    case 1        
        w = 0.85;
        y0 = sin(w.*x);
        for i = [-4.5:0.1:0 0:-0.1:-2.5]
            clf;
            c = 0;
            am = w * i;
            for lw = [1:6 6:-1:1]
                y = (-1)^c.*y0.*am + c;
                hold on;
                plot(x,y,'LineWidth',lw);
                axis([-10 10 -5 15]);
                c = c + 1;
            end
            pause(0.01)
        end
        
    case 2        
        for w = [-6.5:0.1:-2.5  -2.5:-0.1:-6.5]
            clf;
            am = w/10;
            y0 = sin((w+1).*x);
            c = 0;
            for lw = [1:6 6:-1:1]
                hold on;
                y = (-1)^c.*y0.*am + c;
                plot(x,y,'LineWidth',lw);
                axis([-10 10 -5 15]);
                c = c + 1;
            end
            pause(0.01)
        end
        
    case 3
        I0 = imread('tmp.png');
        
%         I = 0.5*I0;  % darker
        Id = im2double(I0);
        s = size(Id);
        h = s(1);
        w = s(2);
        r1 = 50;
        r2 = 60;
        dd =r1*1.8;
        ref = [h/2 w/2];
        C = [...
            ref;...
            ref+[0 dd];...
            ref+[0 -dd];...
            ref+[dd/2 dd/2];...
            ref+[dd/2 -dd/2]...
            ];
        K = ones(size(Id),'double')*0.5;
        for k=(1:5)
            for i=(1:h)
               for j=(1:w) 
                   
                   dis = norm([i j] - C(k,:));
                   if (dis<r2 && dis>r1)
                       K(i,j,:) = 2;
                   end

               end
            end
        end
        
        imshow(Id.*K);
        

        
end