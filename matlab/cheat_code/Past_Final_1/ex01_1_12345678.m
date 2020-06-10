%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: 1
% Problem number: 1
% Student Name:  
% Student ID: 
% Email address: 
% Department:
% Date: 2019/06/13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Final Exam Problem 1.1') 	% show Problem Number

disp('Student Name: TSAI YU CHENG');
disp('Student ID: 0716074');
a = input('Do you want to show the tail of the free particle (yes/no)? ','s');

w=400;
G = 47.3; m = 1; r1 = 50;
r2 = 200; 
P = zeros(3,2);
F3 = zeros(1,2);

t=0;
v=zeros(1,2);
a=zeros(1,2);
md = 10;
if(strcmp(a,'yes')==1)
    b= input('Which format to be used for showing the systems?');
    if b==1
        subplot(1,2,1);
        subplot(1,2,2);
        axis([-w w -w w]);
        pbaspect([1 1 1]);
        
    else
        subplot(2,1,1);
        subplot(2,1,2);
        axis([-w w -w w]);
        pbaspect([1 1 1]);

    end
else
    b= input('Which format to be used for showing the systems?');
    if b==1
        while(1)
            clf;
            for k=(1:2)
                
                
                if k==1
                    w1 = 0.5; w2 = 0.5;  % angular speeds of the two constrained particles
                    M1 = 13900; M2 = 19900; % mass of the two constrained particles
                else
                    w1 = 0.8; w2 = 0.8; % angular speeds of the two constrained particles
                    M1 = 15500;  M2 = 16000; 
                end
                
                P(1,1) = r1.*cos(w1 .*t);
                P(1,2) = r1.*sin(w1 .*t);
                P(2,1) = r2.*cos(w2 .*t);
                P(2,2) = r2.*sin(w2 .*t);


                F31 = -((P(3,:)-P(1,:)).*m.*M1)./(norm(P(3,:)-P(1,:)).*(norm(P(3,:)-P(1,:))).^2);
                F32 = -((P(3,:)-P(2,:)).*m.*M2)./(norm(P(3,:)-P(2,:)).*(norm(P(3,:)-P(2,:))).^2);
                F3 = F31+F32;
                a =F3./m;    
                v = v+a.*0.05;
                if (norm(v)>500)
                    v = v./norm(v).*500;
                end
                pq1 = P(3,:)-P(1,:);
                pq2 = P(3,:)-P(2,:);
                if (norm(pq1)<md)
                    P(3,:) = P(1,:) + pq1./norm(pq1).*md;
                end
                if (norm(pq2)<md)
                    P(3,:) = P(2,:) + pq2./norm(pq2).*md;
                end
                P(3,:) = P(3,:)+v.*0.05;
                t = t+0.05;
                subplot(1,2,k);
                plot(P(1,1),P(1,2),'or');
                hold on;
                plot(P(2,1),P(2,2),'ob');
                plot(P(3,1),P(3,2),'.');
                s1 = sprintf('M1 mass= %d; M2 mass= %d; Pos:(%.2f,%.2f) Vol:(%.2f,%.2f)',M1,M2,P(3,1),P(3,2),v(1,1),v(1,2));
                title({s1});
                axis([-w w -w w]);
                pbaspect([1 1 1]);
            end            
            pause(0.001);
        end
    else
        subplot(2,1,1);
        subplot(2,1,2);
        axis([-w w -w w]);
        pbaspect([1 1 1]);

    end
end

