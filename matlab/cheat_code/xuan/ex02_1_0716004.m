%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: 2
% Problem number: 1
% Student Name: cheng wen xuan
% Student ID: 0716004
% Email address: wenxuan1125@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/06/06
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Final Exam Problem 2.1') 	% show Problem Number

disp('Student Name:cheng wen xuan');
disp('Student ID:0716004');

n=input('Please input the number of samples, n, which is in [0 2000000]:');
if n~=0
    while 1
        a=input('Please input a number, a, which is in [0.1, 1]:');
        if  a>=0.1 && a<=1 
            break
        end
    end
    while 1
        b=input('Please input a number, b, which is in [-1, -0.1] or [0.1, 1]:');
        if  (b>=0.1 && b<=1) ||  (b>=-1 && b<=-0.1)
            break
        end
    end
    
    Y=rand(1, n);
    X=b.*sin(pi./2.*a.*(Y.^2));
    m=mean(X); sd=std( X);
    
    %function of pdf
    syms x y;
    func=b*sin(pi/2*a*(y^2));
    root=solve( x==func, y);
    
    %find the value of x when y=0.5 
    y0=0.5;
    x0=double(subs( func, y, y0));
    
    %choose the right root
    for i=1:size( root, 1)
        %double(subs( root(i), x, x0))
        if( double(subs( root(i), x, x0))>0 & double(subs( root(i), x, x0))<1)
            cdf=root(i);
            break;
        end
    end
    
    %check whether cdf is cdf or 1-cdf
    diff_func=diff( func);
    if( double( subs( diff_func, y, y0))<0)
        cdf= 1-cdf;
    end
    
    pdf=diff( cdf);
    %pdf_x=floor(min(X)): 0.05: ceil(max(X));
    pdf_x=linspace( min(X), max(X));
    pdf_x=pdf_x( subs((2*pi^(1/2)*asin(x)^(1/2)*(1 - x^2)^(1/2)), x, pdf_x)~=0);
    pdf_x=pdf_x(subs(pdf, x, pdf_x)<80);
    pdf_y=double( subs( pdf, x, pdf_x));
    Y_pdf_x=rand( 1, size( pdf_x, 2));
    Y_pdf_x=sort(Y_pdf_x);
    Y_pdf_y=ones( size( pdf_x));
    
    i=1;
    while 1
        clf;
        
        subplot( 1, 2, 1);
        H=histogram(Y, 'Normalization', 'pdf');
        hold on
        plot( Y_pdf_x, Y_pdf_y, 'r', 'LineWidth', 1);
        hold on
        plot( Y_pdf_x(i), Y_pdf_y(i), '.r', 'MarkerSize', 10);
        title('pdf of Y', 'FontSize', 6);
        set(gca,'FontSize',6);
        
        subplot( 1, 2, 2);
        H=histogram(X, 'Normalization', 'pdf');
        hold on
        plot( pdf_x, pdf_y, 'r', 'LineWidth', 1);
        hold on
        if b>0
            plot( pdf_x(i), pdf_y(i), '.r', 'MarkerSize', 10);
        else
            plot( pdf_x(end-i), pdf_y(end-i), '.r', 'MarkerSize', 10);
        end
        title_message=sprintf('pdf of X\nM=%f; SD=%f; a=%f; b=%f;', m, sd, a, b);
        title(title_message, 'FontSize', 6);
        set(gca,'FontSize',6);
        
        if Y_pdf_x(i)==Y_pdf_x(end)
            i=1;
        else
            i=i+1;
        end
       
        figure(1);
        pause( 1/30);
    end
end
    
