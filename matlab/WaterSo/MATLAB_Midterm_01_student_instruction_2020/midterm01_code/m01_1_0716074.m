%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 1
% Problem number: 1
% Student Name: TSAI YU CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: CS
% Date: 4/23
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 1.1') 	% show Midterm Problem 1.1

disp('Student Name: TSAI YU CHENG; Student ID:0716074');


while(1)
    ab = input('Input a ,b: ');
    if (ab(1)==0 && ab(2)==0)
        fprintf("Thanks for playing");
        return;

    end
    a = ab(1);
    b=ab(2);
    while(1)
     dx = input('Input step size: ');

     if(dx==0)
         dx=0.5;
         break;
     elseif (dx <0)
         fprintf('dx must be a non-negative number'); 
         continue;
     else
         break;
     end
    end
    x =(-10:dx: 10); 
    y = a.* sin(abs(x).*sin(x))+ b.*cos(5.*x.*cos(x));
    plot(x,y,'LineWidth',3);
    set(gca,'FontSize',15); 
    hold on;
    figure(1);
end

close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 1.2') 	% show Midterm Problem 1.1

disp('Student Name: TSAI YU CHENG; Student ID:0716074');

c = input('Input c: ');
%x=-10:0.05:10;

while 1
	%coef = input('Please input the coefficients [a0,b0]:');
    if c<0 
        fprintf('Thanks for playing.\n');
        return;
    end
    
    clf;
    dx = 0.0001;


    for b=(0:2:100)
       % x y + b y2 + b x2 (|cos(y2)|+1) = 0.
       y = (-6:dx:6);
       aa = b.*(cos(y.^2)+2);
       bb = c.*y;
       cc = -y.^2./(abs(y)+1);
       x1 = (-bb+sqrt(bb.^2-4.*aa.*cc))./(2.*aa);
       x2 = (-bb-sqrt(bb.^2-4.*aa.*cc))./(2.*aa);
       plot(x1,y,'LineWidth',3);
       plot(x2,y,'LineWidth',3);

       figure(1);
       axis([-6 6 -6 6]);
       pause(0.05);

       hold on;
    end


end



close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 1.3') 	% show Midterm Problem 1.1

disp('Student Name: TSAI YU CHENG; Student ID:0716074');

while(1)

    m = input('Input m: ');
    if (m==0)
        fprintf("Thanks for playing");
        return;
    end
    if(m<0 || m>20 || mod(m,1)~=0)
        continue;
    end
         
    clf;
    dx = 0.02;
    for n=(0:m)
        
        x = (-6*pi:dx:6*pi);
        y1 = x.*sin(x);
        syms k;
        y2 = symsum(x.*(-1)^k.*x.^(2*k+1)./factorial(2*k+1),k,0,n);
        
        plot(x,y1,'LineWidth',6,'color','r');
        hold on;
        plot(x,y2,'LineWidth',3);
        hold on;
        
        axis([-6*pi 6*pi -20 20]);
        figure(1);
        pause(0.2);

    end
    
end


close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 1.4') 	% show Midterm Problem 1.1

disp('Student Name: TSAI YU CHENG; Student ID:0716074');


while(1)
    d = input('Input d in [0,1]: ');
    if d==0
        return;
    end
    if(d<0 || d>1)
        continue;
    end
    c0 = (-4:0.05:4);
    dx=0.001;
    for c=c0
        clf;
        x=(-10:dx:10);
        y1 = c.*x.*cos(x).*exp(sin(x)) + (x.^2+1).^(1/2); 
        y2 =(x+c).*(x-5).*(x+5).*(abs(cos(2.*x))+d );
        y = y1./y2;
        %plot(x,y,'LineWidth',3);
        ylim([-100, 100]);
  
        
        
        hold on;
        I1=find(x<-5);
        x1=x(I1);
        y1=y(I1);
        plot(x1,y1,'lineWidth',3);
    
        hold on;
        I2=find(x>-5 & x<-c);
        x2=x(I2);
        y2=y(I2);
        plot(x2,y2,'lineWidth',3);
    
        hold on;
        I3=find(x>-c & x<5);
        x3=x(I3);
        y3=y(I3);
        plot(x3,y3,'lineWidth',3);
    
        hold on;
        I4=find(x>5);
        x4=x(I4);
        y4=y(I4);
        plot(x4,y4,'lineWidth',3);

        ylim([-100,100]);      
        pause(0.1);
    end

end
 


close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 1.5') 	% show Midterm Problem 1.1



I = imread('tmp.png');
C = imresize(I,[320,320]);
Id = im2double(C);

s = size(Id);
w = s(2);
h = s(1);

op = input('input opt: ');
if op == 0
    disp('Student Name: TSAI YU CHENG; Student ID:0716074');
    return;
end


if op==1
    step = 1;
    while step < w
        if(step>1)
           s= step-1;
           Id(:, s:s+1, 1) = o1;
           Id(:, s:s+1, 2) = o2;
           Id(:, s:s+1, 3) = o3;
        end
        o1 = Id(:, step:step+1, 1) ;
        o2 = Id(:, step:step+1, 2);
        o3 = Id(:, step:step+1, 3) ;
        Id(:, step:step+1, 1) = 1;
        Id(:, step:step+1, 2) = 1;
        Id(:, step:step+1, 3) = 1;
        step = step + 1;
        pause(0.0001);
        imshow(Id);
    end
end
if op==2
    step=w;
    while step > 0
        if(step<w)
           s= step+1;
           Id(:, s:-1:s-1, 1) = o1;
           Id(:, s:-1:s-1, 2) = o2;
           Id(:, s:-1:s-1, 3) = o3;
        end
        o1 = Id(:, step:-1:step-1, 1) ;
        o2 = Id(:, step:-1:step-1, 2);
        o3 = Id(:, step:-1:step-1, 3) ;
        Id(:, step:-1:step-1, 1) = 1;
        Id(:, step:-1:step-1, 2) = 1;
        Id(:, step:-1:step-1, 3) = 1;
        step = step - 1;
        pause(0.2);
        imshow(Id);
    end
end

% if op==3
%     step = 1;
%     while step < h
%         if(step>1)
%            s= step-1;
%            Id(:, s:s+1, 1) = o1;
%            Id(:, s:s+1, 2) = o2;
%            Id(:, s:s+1, 3) = o3;
%         end
%         o1 = Id(:, step:step+1, 1) ;
%         o2 = Id(:, step:step+1, 2);
%         o3 = Id(:, step:step+1, 3) ;
%         Id(:, step:step+1, 1) = 1;
%         Id(:, step:step+1, 2) = 1;
%         Id(:, step:step+1, 3) = 1;
%         step = step + 1;
%         pause(0.0001);
%         imshow(Id);
%     end
% end
% if op==4
%     step=h;
%     while step > 0
%         if(step<h)
%            s= step+1;
%            Id(:, s:-1:s-1, 1) = o1;
%            Id(:, s:-1:s-1, 2) = o2;
%            Id(:, s:-1:s-1, 3) = o3;
%         end
%         o1 = Id(:, step:-1:step-1, 1) ;
%         o2 = Id(:, step:-1:step-1, 2);
%         o3 = Id(:, step:-1:step-1, 3) ;
%         Id(:, step:-1:step-1, 1) = 1;
%         Id(:, step:-1:step-1, 2) = 1;
%         Id(:, step:-1:step-1, 3) = 1;
%         step = step - 1;
%         pause(0.2);
%         imshow(Id);
%     end
% end
% 
% if opt == 1
%     Id(1:5,:, 1) = 0;
%     Id(1:5,:, 2) = 0;
%     Id(1:5,:, 3) = 1.0;
%     
%     Id((h/2-2):(h/2+2),:, 1) = 0;
%     Id((h/2-2):(h/2+2),:, 2) = 0;
%     Id((h/2-2):(h/2+2),:, 3) = 1.0;
%     
%     Id((h-5):h,:, 1) = 0;
%     Id((h-5):h,:, 2) = 0;
%     Id((h-5):h,:, 3) = 1.0;
% elseif opt == 2
%     step = 1;
%     while step < h
%         Id((step):(step+4), :, 1) = 0;
%         Id((step):(step+4), :, 2) = 0;
%         Id((step):(step+4), :, 3) = 1.0;
%         step = step + h/4;
%     end
%     Id(h-5:h, :, 1) = 0;
%     Id(h-5:h, :, 2) = 0;
%     Id(h-5:h, :, 3) = 1.0;
% elseif opt == 3
%     step = 1;
%     while step < h
%         Id((step):(step+4), :, 1) = 0;
%         Id((step):(step+4), :, 2) = 0;
%         Id((step):(step+4), :, 3) = 1.0;
%         step = step + h/8;
%     end
%     Id(h-5:h, :, 1) = 0;
%     Id(h-5:h, :, 2) = 0;
%     Id(h-5:h, :, 3) = 1.0;
% else
% end




    
    
