%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: ¡K
% Problem number: ¡K
% Student Name:  ¡K
% Student ID: ¡K
% Email address: ¡K
% Department:
% Date: ¡K.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all; clear; clc;		 
disp('Midterm Probl()em 1.1');

while(1)
    a = input('Input a: ');
    if (a==0)
        fprintf("Thanks for playing");
        break;
        
    end
    while(1)
     dx = input('Input step size: ');

     if(dx==0)
         dx=0.025;
         break;
     elseif (dx <0)
         fprintf('dx must be a non-negative number'); 
         continue;
     else
         break;
     end
    end
    x =(-5:dx: 5); 
    y = a.* cos (abs(x))+ sin(6.*x.^2)-1./(x.^2+1);
    plot(x,y,'LineWidth',3);
    hold on;
end

close all; clear; clc;		 
disp('Midterm Problem 1.2');
while(1)
    b = input('Input b: ');
    if (b==0)
        fprintf("Thanks for playing");
        break;
        
    end
    clf;
    dx = 0.001;
    for a=(1:10)
       % x y + b y2 - a x2 (|cos(y2)|+1) = 0.
       y = (-5:dx:5);
       aa = -a.*(abs(cos(y.^2))+1);
       bb = y;
       cc = b.*y.^2;
       x1 = (-bb+sqrt(bb.^2-4.*aa.*cc))./(2.*aa);
       x2 = (-bb-sqrt(bb.^2-4.*aa.*cc))./(2.*aa);
       plot(x1,y,x2,y,'Linewidth',3);

       xlim([-10,10]);
       ylim([-5,5]);
       hold on;
    end
    
end


close all; clear; clc;		 
disp('Midterm Problem 1.3');
while(1)
    m = input('Input m: ');
    if (m==0)
        fprintf("Thanks for playing");
        break;
    end
    if(m<0 || m>5 || mod(m,1)~=0)
        continue;
    end

    
    clf;
    
    dx = 0.02;
    for n=(0:m)
        
        x = (-5:dx:5);
        y1 = sinh(x);
        syms k;
        y2 = symsum(x.^(2*k+1)./factorial(2*k+1),k,0,n);
        
        plot(x,y1,'LineWidth',5,'color','b');
        hold on;
        plot(x,y2,'LineWidth',2);
        hold on;
    end
    
end

close all; clear; clc;		 
disp('Midterm Problem 1.4');
while(1)
    b = input('Input b: ');
    x=(-5:0.001:5);
    y = (2.*exp(-2.*x)-b.*x.*cos (abs(5.*x)) + sqrt(abs(x))) ./ ((x-1).*(x-2).*(x+1).*(x+2));
    %plot(x,y,'lineWidth',3);
    ylim([-50,50]);
    
    hold on;
    I1=find(x<-2);
    x1=x(I1);
    y1=y(I1);
    plot(x1,y1,'lineWidth',3);
    
        hold on;
    I2=find(x>-2 & x<-1);
    x2=x(I2);
    y2=y(I2);
    plot(x2,y2,'lineWidth',3);
    
        hold on;
    I3=find(x>-1 & x<1);
    x3=x(I3);
    y3=y(I3);
    plot(x3,y3,'lineWidth',3);
    
        hold on;
    I4=find(x<2 & x>1);
    x4=x(I4);
    y4=y(I4);
    plot(x4,y4,'lineWidth',3);
    
        hold on;
    I5=find(x>2);
    x5=x(I5);
    y5=y(I5);
    plot(x5,y5,'lineWidth',3);
    ylim([-50,50]);
end
