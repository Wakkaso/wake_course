%Rounding functions
A = [-2:0.4:2];
round(A) % 四捨五入
fix(A) % 靠近0
floor(A) % 靠近小的
ceil(A) % 靠近大的

%mamy functions
max()
sum()
min()
prod()
mean()
sort()
median
sortrows
size()
length()
std()
var()

%Discrete-mathematics functions
factor(24) % 質因數分解
rats(3.5122, 14) % ans = ' 17561/5000 ' 弄成分數
factorial(5) % ans = 5! = 120 階
gcd(15, 24) % 最大公因數
lcm(15,24) % 最小公倍數

%sortrows
A = [1 2 3; 1 1 5; 5 1 1; 1 5 5];
disp(A);
B = sortrows(A); % 整行做排序
disp(B);
C = sortrows(A,2); % 第二行順序優先
disp(C);
D = sortrows(A, -2); % 第二行順序優先，大到小，不是上面整個倒過來
disp(D);
E = sortrows(A, [-2 3]); % 第二行順序優先，大到小，再看第三行小到大
disp(E);
%%%%%%%%%% exercise %%%%%%%%%%%
v = [4 3 2 1 6 5 4];
disp('size(v)');
disp(size(v));

disp('sort(v)');
disp(sort(v));

disp('sort(v,'+'descend'+')');
disp(sort(v, 'descend'));

disp('mean(v)');
disp(mean(v));

disp('median(v)');
disp(median(v));

disp('std(v)');
disp(std(v));

disp('prod(v)');
disp(prod(v));

%%%%%%%%%% exercise %%%%%%%%%%%
v = [4 4; 3 3; 2 2; 1 1; 6 2; 5 8; 4 9];
disp('1');
disp(sortrows(v,2));
disp('2');
disp(sortrows(v, -1));
disp('3');
disp(mean(v,2));
disp('4');
disp(mean(v,1));

%%%%%%%%%% exercise %%%%%%%%%%%
v = [ 4 3 7 5 4 9 2; 4 5 3 9 7 5 1; (7:-1:1)];
sort(v)
prod(v)
prod(prod(v))

%%%%%%%%%% probability %%%%%%%%%%%
% generation of random numbers
rng('default') % for reproducibility 
r = normrnd(0,1)

% 這裡我是看不太懂

% Save the current state of the random number generator.
s = rng;
r = normrnd(0,1)

%Restore the state of the random number generator to s 	
rng(s); 
r = normrnd(0,1)	% same set of numbers are generated
% random number between 0~30
w = 30.*rand(1)

%%%%%% normal random numbers %%%%%
% create a new 1-by-n vector of random numbers
%n = 10;
n = 100;
%n = 10000;
y = zeros(1,n);
c = 0;
sigma = 2;
r  = normrnd( c, sigma, [1,n] );
plot(r,y,'o')

%%% Gaussian curve membership function %%%
x = -5:0.1:5
sig = 1; c = 0;
y = gaussmf(x, [sig c]);
plot(x,y)

%%% complex number %%%
a = 2; b = 3;
c = a+b*i;
c = complex(a, b)
real(c)
imag(c)
abs(c)
angle(c)

clock

