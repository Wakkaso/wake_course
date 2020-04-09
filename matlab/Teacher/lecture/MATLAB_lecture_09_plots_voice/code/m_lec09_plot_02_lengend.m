%version 1
clf
for a = [ 1 2 4]
x = [-10:0.05:10];
y = a.*sin(x);
plot(x,y, 'LineWidth', 3);
hold on
end
legend('\alpha=1', ...
    '\alpha=2', ...
    '\alpha=4');
hold off
text(pi/2, 1, '\alpha=1');
text(pi/2, 2, '\alpha=2');
text(pi/2, 4, '\alpha=4');

%version 2
clf
for a = [ 1 2 4]
x = [-10:0.05:10];
y = a.*sin(x);
plot(x,y, 'LineWidth', 3);
hold on
end
legend('\alpha=1', ...
    '\alpha=2', ...
    '\alpha=4');
hold off
text(pi/2, 1, '\alpha=1');
text(pi/2, 2, '\alpha=2');
text(pi/2, 4, '\alpha=4');
set(gca,'FontSize',15);

%version 3
clf
for a = [ 1 2 4]
x = [-10:0.05:10];
y = a.*sin(x);
plot(x,y, 'LineWidth', 3);
hold on
end
legend('\alpha=1', ...
    '\alpha=2', ...
    '\alpha=4');
hold off
text(pi/2, 1, '\alpha=1', 'FontSize',16);
text(pi/2, 2, '\alpha=2', 'FontSize',16);
text(pi/2, 4, '\alpha=4', 'FontSize',16);
set(gca,'FontSize',15);


%version 4
clf
ymin = 0; ymax = 0;
for a = [ 1 2 4]
x = [-10:0.05:10];
y = a.*sin(x);
ymin = min([y ymin]);
ymax = max([y ymax]);
plot(x,y, 'LineWidth', 3);
hold on
end
legend('\alpha=1', ...
    '\alpha=2', ...
    '\alpha=4');
hold off
text(pi/2, 1+0.25, '\alpha=1', 'FontSize',16);
text(pi/2, 2+0.25, '\alpha=2', 'FontSize',16);
text(pi/2, 4+0.25, '\alpha=4', 'FontSize',16);
set(gca,'FontSize',15);

axis([ min(x) max(x) (ymin -0.5) (ymax +0.5)]);

%version 5
clear;
clf
msg = [];
hold on
ymin = 0; ymax = 0;
i = 1; A = [ 1 2 4];
for a = A
x = [-10:0.05:10];
y = a.*sin(x);
ymin = min([y ymin]);
ymax = max([y ymax]);
plot(x,y, 'LineWidth', 3);
s = sprintf('\\alpha=%d',a);
i = i + 1;
msg = [msg;s];
end
%legend(msg(1),msg(2), msg(3));
legend(msg);
for i = [1:3] 
    text(pi/2, A(i)+0.25, msg(i,:), 'FontSize',16)
end
hold off
set(gca,'FontSize',15);
axis([ min(x) max(x) (ymin -0.5) (ymax +0.5)]);
xlabel('x', 'color', 'red');
ylabel('y', 'color', 'blue');
gtext('Here');