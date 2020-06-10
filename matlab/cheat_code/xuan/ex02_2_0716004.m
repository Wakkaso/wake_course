%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: 2
% Problem number: 2
% Student Name: cheng wen xuan
% Student ID: 0716004
% Email address: wenxuan1125@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/06/10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
% clear variables, and clear screen

disp('Final Exam Problem 2.2') 	% show Problem Number

disp('Student Name:cheng wen xuan');
disp('Student ID:0716004');

fprintf('Option 1) Function Graph\nOption 2) Fractal\n\n');
option = input('Enter the option: ');

if option==1
    g11 = @(a,b)(a+b);
    g12 = @(a,b)(a-b);
    %
    g21 = @(a,b)(sin(a)./(cos(b).*cos(b)+1));
    g22 = @(a,b)(a.*b);
    g23 = @(a,b)(a+b);
    g24 = @(a,b)(b-a);
    %
    g31 = @(a,b)(exp(-(a+b).*(a+b)));
    g32 = @(a,b)(a-b);
    g33 = @(a,b)(sin(a)+cos(b));
    g34 = @(a,b)((cos(b)./(abs(a)+1)));
    %
    g41 = @(a,b)(sin(b)+cos(a));
    g42 = @(a,b)(sin(a)+cos(b));
    %
    g51 = @(a,b)(b.*sin(a));
    
    dx = 0.05;
    dy = 0.05;
    x = -1.5:dx:1.5;
    y = -1.5:dy:1.5;
    
    [X, Y] = meshgrid(x,y);
    
    k11 = g11(X, Y);	% result of g11(X,Y)
    k12 = g12(X, Y);
    %
    k21 = g21(k11, k12);
    k22 = g22(k11, k12);
    k23 = g23(k11, k12);
    k24 = g24(k11, k12);
    %
    k31 = g31(k21, k22);
    k32 = g32(k21, k22);
    k33 = g33(k23, k24);
    k34 = g34(k23, k24);
    %
    k41 = g41(k32, k31);
    k42 = g42(k33, k34);
    %
    Z = g51(k41, k42);
    meshz(X, Y, Z);
    set( gca, 'FontSize', 15)
    xlabel('x')
    ylabel('y')
    
    return;
end

if option==2
    julia(120,350);
    saveas( gcf, 'julia.png')
    
    I=imread('tmp.png');
    J=imread('julia.png');
    I=im2double(I);
    J=im2double(J);
    I=imresize(I, [ 525, 700]);
    J=imresize(J, 0.8) ;
    
    mask=1-0.5.*J;
    imshow(mask.*I);
    return;
end

