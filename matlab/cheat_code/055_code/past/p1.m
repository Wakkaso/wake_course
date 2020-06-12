%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: ¡K
% Problem number: ¡K
% Student Name:  ¡K
% Student ID: ¡K
% Email address: ¡K
% Department:
% Date: ¡K.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all; clear; clc;	
disp('Exam Problem 1.1');
disp('id: 0716055');
disp('Name: ¤ýÄ£¼w');
tail = input('Do you want to show the tail of the free particle (yes/no)? ','s');
show = input('Which format to be used for showing the systems?');
G = 47.3;
m = 1;
r1 = 50;
r2 = 200;
p = zeros(3,2);
p2 = zeros(3,2);
f1 = zeros(2,2);
f2 = zeros(2,2);
t = 0;
v=0;
while 1
    clf;
    for d = 1:2
        if d==1
            w1 = 0.5; w2 = 0.5; M1 = 13900; M2 = M1;
        else
            w1 = 0.8; w2 = 0.8; M1 = 13900; M2 = M1;
        end
        p(1,1) = r1*cos(w1*t);
        p(1,2) = r1*sin(w1*t);
        p(2,1) = r2*cos(w2*t);
        p(2,2) = r2*sin(w2*t);
        
        f1(1,:) = -(p(3,:)-p(1,:)).*(m*M1)./(norm(abs(p(3,:)-p(1,:)))*norm(abs(p(3,:)-p(1,:))).^2);
        f1(2,:) = -(p(3,:)-p(2,:)).*(m*M2)./(norm(abs(p(3,:)-p(2,:)))*norm(abs(p(3,:)-p(2,:))).^2);
        
        fnow = f1(1,:)+f1(2,:);
        
        a =fnow./m;    
        v = v+a.*0.1;
        p(3,:) = p(3,:)+v.*0.1;
        if (norm(v)>500)
            v = v./norm(v).*500;
        end
        pq1 = p(3,:)-p(1,:);
        pq2 = p(3,:)-p(2,:);
        md = 10;
        if (norm(pq1)<md)
            p(3,:) = p(1,:) + pq1./norm(pq1).*md;
        end
        if (norm(pq2)<md)
            p(3,:) = p(2,:) + pq2./norm(pq2).*md;
        end

        subplot(show,3-show,d);
        plot(p(1,1), p(1,2),'o');
        hold on;
        plot(p(2,1), p(2,2), 'o');
        hold on;
        plot(p(3,1), p(3,2), '.');
        w = 400;
        axis([-w w -w w]);
        pbaspect([1 1 1]);

    end
    t = t+0.1;
    pause(0.033);
end


