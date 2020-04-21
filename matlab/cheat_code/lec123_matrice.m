m = [6.3, 1.8, 3.7; ...
    4.6, -2.0, 22; ...
    1.7,-7.1, 13.9; ...
    4.3, 0.5, -6.6];

m(2,3); % ans = 22

% combine array
%{
A =
     4     5     6
     8     4     1
B =
     3     1     2
    -4     5     6
     8    -4     1

C = [A; B]

C =
     4     5     6
     8     4     1
     3     1     2
    -4     5     6
     8    -4     1
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

E = zeros(3,5)
E =
     0     0     0     0     0
     0     0     0     0     0
     0     0     0     0     0
     
F =ones(2,4)
F =
     1     1     1     1
     1     1     1     1
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A(2) = 7
A =
    11     7    -9

A(6) = 9
A =
    11     7    -9     0     0     9
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G =
     1     2     3
     4     5     6
     7     8     9
    
G(:,1)
ans =
     1
     4
     7

G(2:3,:)
ans =	
     4     5     6   
     7     8     9
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v(end) 	% extract the last element.

v(5:end)	% extract the fifth through the last elements

v(2:end-1)	% extract the second through the next-to-last elements

v([ 2 3 5]) = [ 10 15 20]	%replace certain elements of the vector

v([ 2 7]) = 30	%replace second and 7-th elements by 30

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = [ 6, 7, 1; ...
     2, 3, 5];
A(6) = 5

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = [ 4 3 2; 2 4 7]

A =
     4     3     2
     2     4     7

A' = 4     2
     3     4
     2     7
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = [ 1 2 3; 4 5 6]
fliplr(a)
ans =
     3     2     1
     6     5     4

flipud(fliplr(a))
ans =

     6     5     4
     3     2     1
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[10+1:15]
 => [ 11 12 13 14 15]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[x y] = meshgrid(-2:2)
x =
    -2    -1     0     1     2
    -2    -1     0     1     2
    -2    -1     0     1     2
    -2    -1     0     1     2
    -2    -1     0     1     2
y =
    -2    -2    -2    -2    -2
    -1    -1    -1    -1    -1
     0     0     0     0     0
     1     1     1     1     1
     2     2     2     2     2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% lec3���b�аj��A���o


     