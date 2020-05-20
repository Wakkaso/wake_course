%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem Category: ? exercise/lab/midterm/exam
% Problem Number: ?
% Student Name:  ?
% Student ID: ?
% Email Address: ?
% Department: ?
% Date: ?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;
% show a message about the problem in the exercise/lab/midterm/exam
disp('Lab') 
I = imread('tmp.png');
I = imresize (I, [640,640]);
Id = im2double(I);
K = ones(size(I), 'double'); s = size(K);i =1;

while(1)
    key=input('Option: ');i=1;
    clf;close all;
    switch(key)
        case{1}
            fprintf('Name: TSAI YU-CHENG ID: 0716074\n');
            return;

        case{2}
            while i <= s(2)-9
                K(:,s(2)-i+1:-1:s(2)-i+1-9,1:3) =i /s(2); i = i +10;
            end
        case{3}
            while i <= s(2)-9
                K(:,i:i+9,1:3) =i /s(2); i = i +10;
            end  
        case{4}
            while i <= s(1)-9
                K(s(1)+1-i:-1:s(1)+1-i-9,:,1:3) =i /s(1); i = i +10;
               
            end
        case{5}
            while i <= s(1)-9
                K(i:i+9,:,1:3) =i /s(1); i = i +10;
            end
        case{6}
           
            [x,y] =meshgrid (1:s(2)/2);
            x = abs((x-s(1)./4)./(s(1)./4)) ;
            y = abs((y-s(2)./4)./(s(2)./4))  ;
            r =sqrt (x.^2 + y.^2);
            res=2.5.*ones(s(1)/2,s(2)/2)-r(:,:);
            K=[res,res;res,res];
%             K(:,:,1) = ones(s(1),s(2))-r(:,:);
%             K(:,:,2) = ones(s(1),s(2))-r(:,:);
%             K(:,:,3) = ones(s(1),s(2))-r(:,:);
    end
    imshow(Id.*K);

end 


 


