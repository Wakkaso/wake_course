%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: 1
% Problem number: 1
% Student Name: cheng wen xuan
% Student ID: 0716004
% Email address: wenxuan1125@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/06/06
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Final Exam Problem 1.1') 	% show Problem Number

disp('Student Name:cheng wen xuan');
disp('Student ID:0716004');

tail_op=input('Do you want to show the tail of the free particle (yes/no)?', 's');
show_op=input('Which format to be used for showing the systems (1)1x2 (2)2x1?');

G=47.3;
r=[50, 200];
w=[0.5, 0.5; 0.8 0.8];
m=1; M=[13900, 19900; 15500, 16000];
t=0; dt=0.05;
maxv=500; mind=10;


p=[ 125, 0; 125, 0];
a=[ 0, 0];
v=[ -50, 50; -50, 50];
p_tail=p;

while 1
    clf
    
    %if t==0.1
    %   break
    %end
    for i=1:2
        p1=[ r(1).*cos(w( i, 1).*t), r(1).*sin(w( i, 1).*t)];
        p2=[ r(2).*cos(w(i, 2).*t), r(2).*sin(w( i, 2).*t)];
        
        F=-(p( i, :)-p1)./norm(p( i, :)-p1).*m.*M(i, 1)./((p( i, :)-p1)*(p( i, :)-p1)')...
            -(p( i, :)-p2)./norm(p( i, :)-p2).*m.*M(i, 2)./((p( i, :)-p2)*(p( i, :)-p2)');
        a=F./m;
        v(i, :)=v(i, :)+a.*dt;
        if (norm(v(i, :))>maxv)
            v(i, :)= v(i, :)./norm(v(i, :)).*maxv;
        end
        
        p( i, :)=p( i, :)+v(i, :).*dt;
        pq=p( i, :)-p1;
        if (norm(pq)<mind)
          p( i, :) = p1 + pq./norm(pq).*mind;
        end
        pq=p( i, :)-p2;
        if (norm(pq)<mind)
          p( i, :) = p2 + pq./norm(pq).*mind;
        end
        
        if show_op==1
            subplot( 1, 2, i);
        else
            subplot( 2, 1, i);
        end
        plot( p1(1), p1(2), 'ro', 'MarkerSize', 3)
        hold on;
        plot( p2(1), p2(2), 'bo', 'MarkerSize', 3)
        hold on;
        plot( p( i, 1), p( i, 2), 'k.')
        axis([-400 400 -400 400]);
        pbaspect([1 1 1]);
        set(gca,'FontSize', 6);
        title_message=sprintf('M1 mass=%d; M2 mass=%d;\nPos: ( %.2f, %.2f); Vel: ( %.2f, %.2f);',...
            M( i, 1),  M( i, 2),  p( i, 1), p( i, 2), v(1), v(2));
        title(title_message, 'FontSize', 6);
    end
    p_tail=[p_tail, p];
    if strcmp(tail_op, 'yes')
        for i=1:2
            if show_op==1
                subplot( 1, 2, i);
            else
                subplot( 2, 1, i);
            end
            if t>5.6
                plot( p_tail( i, (end-1):-2:(end-1-2*110)), p_tail(i, end:-2:(end-2*110)), 'Color', [0.5, 0.5, 0.5])
            else
                plot( p_tail( i, (end-1):-2:1), p_tail(i, end:-2:1), 'Color', [0.5, 0.5, 0.5])
            end
        end
    end
    
    t=t+dt;
    
    pause(0.01);
    figure(1);
end