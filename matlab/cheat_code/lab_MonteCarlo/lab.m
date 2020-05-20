%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem Category: exercise/lab/midterm/exam
% Problem Number: 1
% Student Name:  TSAI
% Student ID: 0716074
% Email Address: ?
% Department: ?
% Date: ?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show a message about the problem in the exercise/lab/midterm/exam
disp('Lab');
n=0;
while(1)
    n = input('input number of points: ');
    if n==0
        fprintf('ID: 0716074   NAME: TSAI YU CHENG');
        return;
    end
    if n>0 && n<=10000
        break;
    end
end


key = input('Input mode: ');
maxCount = n;
xmin = -5; xmax = 5; ymin = -15; ymax = 15;

switch(key)
    case 1
        count = 0; 
        x = zeros(1, maxCount); y = zeros(1, maxCount);
        while count < maxCount

            while true
                x0 = rand(1);
                x0 = xmin + (xmax-xmin)*x0;
                y0 = rand(1);
                y0 = ymin + (ymax-ymin)*y0;
                y1 = sin(x0).*sqrt(abs(x0)); 
                y2 = 2.*cos(x0).*exp(cos(x0.^2));  
                if (  (y1 <= y0 && y0 <= y2)...
                    || (y2 <= y0 && y0 <= y1))
                    break;
                end     
            end

            count = count + 1;
            x(count) = x0;
            y(count) = y0;
        end

        plot(x,y,'.','Color','g');
        hold on

        X = xmin:0.05:xmax;
        Y1 = sin(X).*sqrt(abs(X)); 
        Y2 = 2.*cos(X).*exp(cos(X.^2));
        subplot(1,1,1);
        plot(X, Y1,'-b', 'linewidth', 2);
        plot(X, Y2,'-r', 'linewidth', 2);
        set(gca,'fontsize', 10);
        axis([-5 5 -5 5]);
        

    case 2
        for a=(1:2)
            x = zeros(1, maxCount); 
            y = zeros(1, maxCount);
            count = 0; 
            while count < maxCount
                while true
                    x0 = rand(1);
                    x0 = xmin + (xmax-xmin)*x0;
                    y0 = rand(1);
                    y0 = ymin + (ymax-ymin)*y0;
                    if a==1
                        y1 = sin(x0).*sqrt(abs(x0)); 
                        y2 = 2.*cos(x0).*exp(cos(x0.^2));  
                    end
                    if a==2
                        y1 = sin(x0)+x0.^2.*cos(x0); 
                        y2 = 2.*sin(x0).*exp(sin(x0.^2));
                    end
                    if (  (y1 <= y0 && y0 <= y2) ...
                        || (y2 <= y0 && y0 <= y1))
                        break;
                    end     
                end

                count = count + 1;
                x(count) = x0;
                y(count) = y0;
            end
            
            X = xmin:0.1:xmax;
            if a==1
                Y1 = sin(X).*sqrt(abs(X)); 
                Y2 = 2.*cos(X).*exp(cos(X.^2));
            end
            if a==2
                Y1 = sin(X)+X.^2.*cos(X); 
                Y2 = 2.*sin(X).*exp(sin(X.^2));
            end
            subplot(2,1,a);
            plot(x,y,'.','Color','g');
            hold on;
            plot(X, Y1,'-b', 'linewidth', 2);
            plot(X, Y2,'-r', 'linewidth', 2);
            set(gca,'fontsize', 10);

        end
    case 3
        for a=(1:4)
            x = zeros(1, maxCount); 
            y = zeros(1, maxCount);
            count = 0; 
            while count < maxCount
                while true
                    x0 = rand(1);
                    x0 = xmin + (xmax-xmin)*x0;
                    y0 = rand(1);
                    y0 = ymin + (ymax-ymin)*y0;
                    if a==1
                        y1 = sin(x0).*sqrt(abs(x0)); 
                        y2 = 2.*cos(x0).*exp(cos(x0.^2));  
                    end
                    if a==2
                        y1 = sin(x0)+x0.^2.*cos(x0); 
                        y2 = 2.*sin(x0).*exp(sin(x0.^2));
                    end
                    if a==3
                        y1 = sin(x0)+(sin(x0)).^2; 
                        y2 = cos(x0)+(cos(x0)).^2;
                    end
                    if a==4
                        y1 = x0.^5.*cos(x0).*exp(-abs(x0)); 
                        y2 = x0.^5.*sin(x0).*exp(-abs(x0));
                    end
                    if (  (y1 <= y0 && y0 <= y2) ...
                        || (y2 <= y0 && y0 <= y1))
                        break;
                    end     
                end

                count = count + 1;
                x(count) = x0;
                y(count) = y0;
            end
            
            
            %hold on
            X = xmin:0.1:xmax;
            if a==1
                Y1 = sin(X).*sqrt(abs(X)); 
                Y2 = 2.*cos(X).*exp(cos(X.^2));
            end
            if a==2
                Y1 = sin(X)+X.^2.*cos(X); 
                Y2 = 2.*sin(X).*exp(sin(X.^2));
            end
            if a==3
                Y1 = sin(X)+(sin(X)).^2; 
                Y2 = cos(X)+(cos(X)).^2;
            end
            if a==4
                Y1 = X.^5.*cos(X).*exp(-abs(X)); 
                Y2 = X.^5.*sin(X).*exp(-abs(X));
            end
            subplot(2,2,a);
            plot(x,y,'.','Color','g');
            hold on;
            plot(X, Y1,'-b', 'linewidth', 2);
            plot(X, Y2,'-r', 'linewidth', 2);
            
            set(gca,'fontsize', 10);
            %axis([-5 5 -5 5]);

        end
      

        
    
end

% 
% y1 = sin(x).*sqrt(abs(x)); y2 = 2.*cos(x)*exp(cos(x.^2));
% y1 = sin(x)+x2cos(x); y2 = 2.*sin(x).*exp(sin(x.^2));
% y1 = sin(x)+(sin(x)).^2; y2 = cos(x)+(cos(x)).^2;
% y1 = x.^5.*cos(x).*exp(-abs(x)); y2 = x.^5.*sin(x).*exp-(-abs(x));
% 

















