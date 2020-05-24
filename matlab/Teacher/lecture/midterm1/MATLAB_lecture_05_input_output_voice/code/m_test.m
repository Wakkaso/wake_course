clear; clc;
format compact
disp('Square area');
while 1
    side_length = input('Input the side length:');
    if (side_length>0) 
        break  
    end
end
area = side_length*side_length

