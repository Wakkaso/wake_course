clf
y = [-10:2:10];
x = 5;
plot(x,y,'o','linewidth', 5); % ����
plot(x,y,'.'); % �I
plot(x,y,'-'); % default
plot(x,y,'--'); % dash
plot(x,y,':'); % dotted
plot(x,y,'-.'); % dash-dot line

%Marker
%{
o Circle
+ Plus sign
* Asterisk
. Point
x Cross
s Square
d Diamond
^ Upward-pointing triangle
v Downward-pointing triangle
> Right-pointing triangle
< Left-pointing triangle
p Pentagram
h Hexagram
%}

%Color
%{
y yellow
m magenta
c cyan
r red
g green
b blue
w white
k black
%}

%Symbol
%{
\alpha �\
\angle ��
\ast *
\beta �]
\gamma �^
\delta �_
\epsilon ?
\zeta �a
\upsilon �o
\phi 
\chi �q
\psi �r
\omega �s
\Gamma �F
\Delta �G
\Theta �K
\sim ~
\leq ?
\infty ��
\clubsuit ?
\diamondsuit ?
\heartsuit ?
\spadesuit ?
\leftrightarrow ?
%}

grid on; % �}��l
grid minor; % �}�p��l
grid off; % ����l

title('test'); % title
xlabel('x', 'color', 'red');
ylabel('y', 'color', 'blue');

hold on;
hold off;
figure % new figure

figure(1), plot(x,y1);
figure(2), plot(x,y2); % �T�ӹ�
figure(3), plot(x,y3);

axis([XMIN XMAX YMIN YMAX]); % �Ϫ�����A�n��[]

set(gca,'FontSize',20); % ������gca�O����ϥ��i�H�ծy�Ъ��r�j�p

text(x0, y0, 'x=0,y=0', 'FontSize',16); % �i�H�b�y�Ю��䥴�r


s = sprintf('x=%2.0f, y=%2.1f',x0, y0);
text(x0+0.3, y0, s, 'FontSize',16); % �i�H�b�y�Ю������s

% ex:
clf;clear
for a = [ 1 2 4]
  x = [-10:0.05:10];
  y = a.*sin(x);
  plot(x,y, 'LineWidth', 3);
  hold on
end
legend('\alpha=1', '\alpha=2', '\alpha=4'); %����
hold off
text(pi/2, 1, '\alpha=1');
text(pi/2, 2, '\alpha=2');
text(pi/2, 4, '\alpha=4');

% plot���Atext�r�~���|�ɨ��I

%%%%%%%%%% ex: �ʵe�e�ϡA���Ҹ�۶] %%%%%%%%%%
close all; clf; clear
figure, axis([ -10 10 -4.5 4.5]);
set(gca,'FontSize',15);
xlabel('x', 'color', 'red');
ylabel('y', 'color', 'blue');
input('Press Enter to start...');

for xUpper = [-10:0.25:10] 
    clf; hold on; ymin = 0; ymax = 0;
    msg = []; i = 1; A = [ 1 2 4];    
    color= ['r' 'g' 'b'];
    x = [-10:0.05:xUpper];
    sx = size(x);
    y = zeros(3, sx(2));
    for a = A
        y(i,:) = a.*sin(x);
        plot(x,y(i,:), 'LineWidth', 3, 'color', color(i));    
        s = sprintf('\\alpha=%d',a);
        i = i + 1;
        msg = [msg;s];
    end

    legend(msg);

    for i = [1:3]
        text(x(end), y(i,end)+0.25, msg(i,:), 'FontSize',16) % end�ܨq
    end

    hold off
    pause(0.033);
end

saveas(gcf,'sin.png'); % save as

% ex: �@�i�ާ@ 
close all; clear; clf
x= -10:0.05:10; y = sin(x); y1 = cos(x);
figure
plot(x, y,'linewidth', 30, 'color', 'b');
hold on
plot(x, y1,'linewidth', 30, 'color', 'r');
set(gcf,'color','k'); set(gca,'visible','off');
saveas(gcf,'sin_01.jpg');
 
I = imread('sin_01.jpg');
figure, imshow(I);
 
I2 = I; K = I2; K = im2double(K);
K = imresize(K, [640 640]);
K1 = 1-K;	% 1 �V (1,0,0) = (0,1,1) = cyan
 		% 1 �V (0,0,1) = (1,1,0) = yellow
L = imread('tmp.png');
figure, imshow(L); L1 = im2double(L);
L1 = imresize(L1, [640 640]);
figure
imshow(L1.*K1);







