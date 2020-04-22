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

clf; clear; clc;		% clear the current figure
        				% clear variables, and clear screen

disp('Lab Problem 1.6') 	% show Lab Problem 1.6
fprintf('\n');
fprintf('Student Name:... ID:...\n');

[x ,y] = meshgrid([-10:0.5:10]);     %
z = 2.*exp(-(y-5).^2).*sin(x) + exp(-x.^2).*cos(y);
z1 = z;
while true
    clf;
    
    surf(z);
    zlim([-2,2]);
    n = input('Press ENTER to continue.');
    ix = size(x(1,:));
    iy = size(y(:,1));
    % for each interior point do
    for i = [(2):40]
        for j = [(2):40]
            %compute the average for a 3x3 grid points.
            an = 0;
            for k = [i-1:i+1]
                for l = [j-1:j+1]
                        an = an + z(k,l);
                end
            end
            z1(i,j) = an/9;
        end
    end
    mesh(z1, zlim);
    z = z1;
end












