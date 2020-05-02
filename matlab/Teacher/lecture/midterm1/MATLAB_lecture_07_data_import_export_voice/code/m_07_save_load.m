<<<<<<< HEAD
clear
x = 4; y =6;
z = x*y + sin(x);
fprintf('Save 07.mat now...\n');
save 07
fprintf('07.mat is saved...\n');

clear
fprintf('Show whos now!\n');
whos
fprintf('Load 07.mat\n');
load('07', 'z');
=======
clear
x = 4; y =6;
z = x*y + sin(x);
fprintf('Save 07.mat now...\n');
save 07
fprintf('07.mat is saved...\n');

clear
fprintf('Show whos now!\n');
whos
fprintf('Load 07.mat\n');
load('07', 'z');
>>>>>>> 542a0a8303d7514c52d858d6ed680356c059c9eb
z