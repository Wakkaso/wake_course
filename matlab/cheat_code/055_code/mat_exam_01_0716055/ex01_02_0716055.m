%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 3
% Problem number: 2
% Student Name:  Chris Wang
% Student ID: 0716055
% Email address: bpploabc@gmail.com
% Department: CS
% Date: 2020/6/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Align the lines
% Select all and then press CONTROL-I
%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show Lab
disp('Final Exam Problem 1.2');
disp('Chris Wang; 0716055');

global key_pressed_op_1;
global key_pressed_op_2;
global key_pressed_op_3;
global key_pressed_op_4;
global key_pressed_quit;
global key_press_return;
global key_press_spacebar;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Align the lines
% Select all (CONTROL-A) and then press CONTROL-I
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

key_press_spacebar = false;
        key_press_return = false;
key_pressed_op_1 = false;
    key_pressed_op_2 = false;
            key_pressed_op_3 = false;
key_pressed_op_4 = false;
key_pressed_quit = false;

h_fig = figure

set(h_fig,'KeyPressFcn',...
    @m_KeyCallBack_image); % callback function


input('Press ENTER to start.');

figure(h_fig);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I = imread('tmp.png');
I = im2double(I);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

op = 2;

mainmsg = ["Key Usage:"...
    "Key 1: Option 1"...
    "Key 2: Option 2"...
    "Key q: Quit the program when in the main menu"...
    "Key r: Return to the main menu immediately"...
    ];

    disp('‘1’ Polar plot');
    disp('‘2’ Spotlight show');
    disp('‘3’ Travel with planet');
    disp('‘4’ Morphing ');
    disp('‘r’ Return to the main menu immediately');
    disp('‘q’ Quit the program when in the main menu');
while true
    clf
    op = 0;
    key_press_spacebar = false;
    key_press_return = false;
    key_pressed_op_1 = false;
    key_pressed_op_2 = false;
    key_pressed_op_3 = false;
    key_pressed_op_4 = false;
    key_pressed_quit = false;
    
    
    title(mainmsg);
    pause(0.03);
    if ( key_pressed_op_1 )
        key_pressed_op_1 = false;
        op = 1;
    end
    if ( key_pressed_op_2 )
        key_pressed_op_2 = false;
        op = 2;
    end
    if ( key_pressed_op_3 )
        key_pressed_op_3 = false;
        op = 3;
    end
    if ( key_pressed_op_4 )
        key_pressed_op_4 = false;
        op = 4;
    end
    if ( key_pressed_quit )
        key_pressed_quit = false;
       
        % close all; % close all the figure windows
       % disp('Student ID:12345678');
        disp('Thanks for playing!');
        
        %return;    % quit the program
        
    end
    if (op ==1)
        %initialize parameters and so on
        %before entering the animation loop
            t = 0;
            se = [];
        while true
            clf;
            %x = [-10:0.01:10];
            if t<2.*pi
                se = [se t];
            end
            r = 1-cos(2.*se).*sin(6*se);
            %y = sin(x+t);
            t = t + 0.1;
            polar(se,r);
            hold on;
            [x y] = pol2cart(se,r);
            fill(x,y,'y');
            polar(se,r,'or');
            hold on;
            title({'Polar plot','Press r to return'});
            pause(0.033);
            if (key_press_return)
                break;
            end;
        end % while
    end % if op ==1
    
    if (op==2) 
        clf;
        %initialize parameters and so on
        %before entering the animation loop
        t = 1; 
        a = 1.5;
        re = imresize(I,[640,640]);
        s = size(re);
        l = size(s);
        [x y] = meshgrid(1:l);
        r = ((x-l/2).^2.+(y-l/2).^2);
        while true
            
            pause(0.033);
            
        end % while
    end % if op == 2
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Add your own stuff here if you want
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if (op==3) 
        clf;
        %initialize parameters and so on
        %before entering the animation loop
        
        
t = 0;
v = [-1 7];
p = [50 3];
p0 = p;
dt = 0.05;
M = 10000;
m = 1;
d = 0.01;
figure(1);
i = 1;
i0 = [];
sd0 = [];
while t<100
    clf;
    F = -(p.*m.*M)./(norm(p).*(p*p'));
    a = F./m - d.*v.*abs((2.*sin(t)));
    v = v + a.*dt;
    p = p + v.*dt;
    p0 = [p0; p];
    t = t+ dt; 
    subplot(1, 2, 1);
    plot(p0(:,1), p0(:,2));
    hold on;
    if i>9
        plot(p0(i-8:i,1), p0(i-8:i,2), 'o');
    end
    axis([-10 50 -30 30]);
            title({'Travel with planet','Press r to return'});
    pbaspect([1 2 1]);
    
    if i>9
        i0 = [i0 i];
        dq = p0(i-8:i-1, :) - p0(i-7:i,:);
        d2 = dq(:,1).*dq(:,1) + dq(:,2).*dq(:,2);
        d1 = sqrt(d2);
        sd = sum(d1);
        sd0 = [sd0 sd];
        subplot(1, 2, 2);
        plot(i0, sd0);
    end
        i = i+1;
    pause(0.033);
    if (key_press_return)
                break;
            end;
end
        
        
    end % if op == 3
    
    
    
    if (op==4) 
        clf;
t = -10:0.025:10;
a1 = 10; b1 = 5; c1 = 0; n1 = 3; 

x1 = a1 .* sin( n1.*t + c1 );
y1 = b1.*cos(t);

a2 = 5;
x2 = a2 .* ( 2.*cos(t) - cos(5.*t) );
y2 = a2 .* ( 2.*sin(t) - sin(5.*t) );

input('Press ENTER to continue...');

figure(1);
for h = 0:0.01:1
   clf;
   k1 = 2*h*sin(h*2*pi);
   k = (sin(k1*pi/2)).^2;
   
   xx = (1-k1).*x1 + k1.* x2;
   yy = (1-k1).*y1 + k1.* y2;
   
   subplot(1, 2, 1);
   plot(x1, y1, 'linewidth', 3);
   hold on;
   plot(x2, y2, 'linewidth', 3);
   hold on;
   plot(xx, yy, 'linewidth', 3);
   axis([-50 50 -20 20]);
   title({'Morphing ','Press r to return'});
   
   xx = (1-k).*x1 + k.* x2;
   yy = (1-k).*y1 + k.* y2;
   
   subplot(1, 2, 2);
   plot(x1, y1, 'linewidth', 3);
   hold on;
   plot(x2, y2, 'linewidth', 3);
   hold on;
   plot(xx, yy, 'linewidth', 3);
   axis([-50 50 -20 20]);
   if (key_press_return)
                break;
   end;
   if (key_press_return)
                break;
            end;
   pause(0.033);
end
        
    end % if op == 4
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % BEGIN: Do not modify the following code fragment
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    while true
        
        if (op==0) break; end
        
        title('Press c to continue...');
        pause(0.03);
        if (key_press_spacebar)
            break;
        end
        
    end
    hold off
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % END: Do not modify the above code fragment
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end % while
hold off;
    
    
    
