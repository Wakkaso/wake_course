<<<<<<< HEAD
[names, course, s1, s2, s3, status] = ...
    textread('mydata.txt', ... 
    '%s %s %f %f %d %s', 1)

[names, course, s1, s2, s3, status] = ...
    textread('mydata.txt', ... 
    '%6c %7s %3f %f %d %s', 1)

[names, course, s1, s2, s3, status] = ...
    textread('mydata.txt', ... 
    '%s MAT%s %f %f %d %s', 1)

data = textread('data.csv', '', 'delimiter', ',', ... 
    'emptyvalue', NaN);

 [data] = textread('data.csv','','delimiter',',');

clear
x = boolean([1 0 1 0 0 0; ...
    1 1 0 0 1 0 ])
a(x) = 6
=======
[names, course, s1, s2, s3, status] = ...
    textread('mydata.txt', ... 
    '%s %s %f %f %d %s', 1)

[names, course, s1, s2, s3, status] = ...
    textread('mydata.txt', ... 
    '%6c %7s %3f %f %d %s', 1)

[names, course, s1, s2, s3, status] = ...
    textread('mydata.txt', ... 
    '%s MAT%s %f %f %d %s', 1)

data = textread('data.csv', '', 'delimiter', ',', ... 
    'emptyvalue', NaN);

 [data] = textread('data.csv','','delimiter',',');

clear
x = boolean([1 0 1 0 0 0; ...
    1 1 0 0 1 0 ])
a(x) = 6
>>>>>>> 542a0a8303d7514c52d858d6ed680356c059c9eb
