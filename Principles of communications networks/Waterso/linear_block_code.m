
G=[ ]; % Generator matrix 
P=[1 1 0; 0 1 1;1 1 1; 1 0 1]; % P is parity check matrix
G=[P eye(4)];
x=[1 1 1 0];
V1=G(1,:);
V2=G(2,:);
V3=G(3,:);
V4=G(4,:);
var1=x(1) & V1 ;
var2=x(2) & V2 ;
var3=x(3) & V3 ;
var4=x(4) & V4 ;
y1=bitxor(var1,var2);
y2=bitxor(y1,var3);
y=bitxor(y2,var4);

















% 
% 
% 
% H=[ ];
% 
% x=[0 0 0 1 1 1 0];
% P=[1 1 0; 0 1 1;1 1 1; 1 0 1]; % P is parity check matrix
% H=[eye(3) P'];
% Ht=H'; 
%  
% S=zeros(1,3); %syndrome
% for i=1:3
%     S(i)=x(1) & Ht(1,i);
%     
%     for j=2:7
%         
%         S(i)=bitxor(S(i), (x(j) & Ht(j,i)));
%     end
% end
