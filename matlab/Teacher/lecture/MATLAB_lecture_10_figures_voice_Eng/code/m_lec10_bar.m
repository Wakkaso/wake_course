clear; clf;
figure;
x = [4 3 2 1 7 8 9; 1 2 3 4 5 6 7];
bar(x);
bar(x, 'FaceColor',...
    [0.3010 0.7450 0.9330]);

%
clear; clf;
figure;
list = categorical({'Jan','Feb','Mar', 'Apr', 'May', 'Jun', 'Jul'}); 
x = [4 3 2 1 7 8 9 ...
    ];
c = categorical(list,list);
bar(c,x);
set(gca,'FontSize',15);

%
clear; clf;
figure;
list = categorical({'Jan','Feb','Mar', 'Apr', 'May', 'Jun', 'Jul'}); 
x = [4 3 2 1 7 8 9 ...
    ];
c = categorical(list,list);
bar(c,x);
set(gca,'FontSize',15);

%%%%%%%%%%%%%%%%%%%%%%%
clear; clf;
figure;
list = categorical({'Jan','Feb','Mar', 'Apr', 'May', 'Jun', 'Jul'}); 
c0 = categorical({'Feb','Mar', 'Apr', 'May', 'Jun', 'Jul', 'Jan'}); 
x = [4 3 2 1 7 8 9 ...
    ];
c = categorical(list,c0);
bar(c,x);
set(gca,'FontSize',15);