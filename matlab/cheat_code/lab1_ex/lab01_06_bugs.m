%{
Debug
Debug the program.
The program show a mesh z.
z = 2 e^(-(y-5)^2) sin(x) + e^(-x^2) cos(y)

It performs smoothing to the mesh each time after ENTER
is pressed. Please watch the demo video.

Show a message 'Press ENTER to continue.' to remind a user 
to press ENTER after the mesh is drawn.

To perform a smoothing operation, 
the z value of an interior point (exclude the boundary points)
is the average of 3x3 grid points centered at the point.
do not change the z values of all the bondary points.

zlim is set to [-2,2].

Show your student ID and Name.

Press Control-C to break the program at any time.
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Write down the information.
% Problem number: Lab 1.6
% Student Name:  …
% Student ID: …
% Email address: …
% Department: 
% Date: ….
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clf; clear; clc;		% clear the current figure
        				% clear variables, and clear screen

disp('Lab Problem 1.6') 	% show Lab Problem 1.6
fprintf('\n');
fprintf('Student Name:... ID:...\n');

[x; y] = GridMesh([-10:0.5:10]);     %
z = 2.*exp(-(y-5)2) sin(x) + exp(-x^2) cos(y);
while true
    clf

    surf(z);
    ylim([-2,2])
    n = input('Press enter to quit.');
    sx = size(x)(1);
    sy = size(y);
    ix = sx[2]; % get the number of elements along the x-axis
    iy = sy[1]; % get the number of elements along the y-axis
    z1 = z;
    % for each interior point do
    for i = [(1):(ix-1)]
        for j = (1+1):(iy)]
            %compute the average for a 3x3 grid points.
           z1(j, i) = (sum(z((i-1):(i+1), (j-3):(j+3)))));
        
    end
    z1 = z1;
end












