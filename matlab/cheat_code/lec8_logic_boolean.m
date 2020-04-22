x = boolean([1 3 0 2 -1 0 2]);
% ans =     [1 1 0 1  1 0 1]

a(x) = 7
% a = [7 7 0 7 7 0 7]

clear
a([1 3 0 2 -1 0 2]) = 7
% a = [7 7 0 7 7 0 7]

clear
x = boolean([1 3 0 2 -1 0 2; 3 2 1 7 0 4 0])
%{
x =
   1   1   0   1   1   0   1
   1   1   1   1   0   1   0
%}
a(x) = 7
%{
a =
     7  7  7  7  0  7  7  7  7  0  0  7  7 % 直的，沒有最後的0
%}

clear
x = boolean([1 0 1 0 0 0; ...
             1 1 0 0 1 0 ]);
%{
x =
  2×6 logical array
   1   0   1   0   0   0
   1   1   0   0   1   0
%}
a = zeros(size(x)); % 對
a(x) = 7
%{
a =
     7     0     7     0     0     0
     7     7     0     0     7     0
%}

%{
1.Arithmetic
2.Relational Operators (<, <=, ==, >=, >, ~=)
3.All ~ (Not) operators 
4.All & (And) operators evaluated from left to right
5.All | (Or) operators evaluated from left to right

~0 – ~2				                                                1
(7 |4) + ~0 -2 		                   1 + ~(-2)	                2
7 -4 + ~1 -1 & 5 -5	                   0 & 0                        true                  
1 + 5 > 7  -4 + ~1 -1 & 5 -4 && 6-6    6 > 7 - 4 + 0 - 1 & 1 && 0   true

~0 – ~2				                   1
(7 |4) + ~0 -2 			               0
7 -4 + ~1 -1 & 5 -5	                   false
1 + 5 > 7  -4 + ~1 -1 & 5 -4 && 6-6    false
%}

% Logical Functions example
%{
a =  0     1     2
     3     0     1
(find(a<=1))          ans = 1 3 4 6

====================================
a = [0 1 2;  ...
       3 0 1];
sparse(a)     
        
ans = 
(2,1)        3
(1,2)        1
(1,3)        2
(2,3)        1
====================================
a =  0     1     2
     3     0     1
[ i  j ] = ind2sub(size(a), 3)

[A B] = ind2sub(size(a), [1 2 3 4])

i = 1   % row index

j = 2   % column index

A =   1     2     1     2
B =   1     1     2     2
====================================
a =
     0     1     2
     3     0     1
nonzeros(a)

ans = 3  1  2  1

%}

% Logical Functions
%{
ischar char?
isinf Inf?
isnan Not a number?
isempty Is [ ] ?
%}

%Round-off errors 



