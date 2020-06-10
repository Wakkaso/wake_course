%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: 1
% Problem number: 2
% Student Name: cheng wen xuan
% Student ID: 0716004
% Email address: wenxuan1125@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/06/06
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Final Exam Problem 1.2') 	% show Problem Number

disp('Student Name:cheng wen xuan');
disp('Student ID:0716004');
fprintf('Menu\nOption 1)\nOption 2)\nOption 3)\n')

op=input('Please enter the option:');

%y=@(x, w) sin( w*x);
%yc=@(x, c, w) ((-1)^c)*y(x, w)+c;

if op==1
    t=0;
    while 1
        clf
        
        w=pi*3/10;
        am=abs(5.*sin(t));
        
        x=-10:0.05:10;
        y=sin( w.*x);
        lw=[1:0.25:2.25, 2.25:-0.25:1];
        for i=0:11
            plot( x, ((-1)^i).*y.*am+i , 'LineWidth', lw(i+1))
            hold on
        end
        t=t+0.05;
        axis([-10 10 -5 15]);
        figure(1)
        pause(0.01)
    end
    
elseif op==2
    t=0;
    while 1
        clf
        
        
        w=abs(9.*sin(t));
        am=w/10;
        x=-10:0.05:10;
        y=sin( (1+w).*x);
        lw=[1:0.25:2.25, 2.25:-0.25:1];
        for i=0:11
            plot( x, ((-1)^i).*y.*am+i , 'LineWidth', lw(i+1))
            hold on
        end
        t=t+0.03;
        axis([-10 10 -5 15]);
        figure(1)
        pause(0.01)
    end
else
    
    I=imread('tmp.png');
    I=im2double(I);
    mask=zeros(size(I));
    mask( :, :, :)=0.5;
    col=size(I, 2);
    row=size(I, 1);
    r1=50; r2=60;
    d=r1*1.8;
    center=[ floor(row/2), floor(col/2)];
    circle_center=[ center; center-[ 0, d]; center+[ 0, d]; center+[ d/2, d/2]; center+[ d/2, -d/2]];
    for i=1:5
        o=circle_center(i, :);
        for j=(o(1)-60):(o(1)+60)
            for k=(o(2)-60):(o(2)+60)
                if( (j-o(1))*(j-o(1))+(k-o(2))*(k-o(2))>=50*50 && (j-o(1))*(j-o(1))+(k-o(2))*(k-o(2))<=60*60)
                    mask( j, k, :)=3;
                end
            end
        end
    end
    imshow(I.*mask);
    
end


