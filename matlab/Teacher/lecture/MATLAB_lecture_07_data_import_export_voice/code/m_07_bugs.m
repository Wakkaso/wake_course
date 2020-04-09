<<<<<<< HEAD
%This program clamp the z value inside [-0.7, 0.7].
% z = sin(x) cos(y)
% x and y inside [-10, 10] with step size 0.25.
%Show the mesh of z.
[x y] = meshgrid([-10:0.25:10]);
z = sin(x) .* cos(y);
z(z > 0.7) = 0.7;
z(z < -.7) = -0.7;
surf(z); % show the mesh of z
=======
%This program clamp the z value inside [-0.7, 0.7].
% z = sin(x) cos(y)
% x and y inside [-10, 10] with step size 0.25.
%Show the mesh of z.
[x y] = meshgrid([-10:0.25:10]);
z = sin(x) .* cos(y);
z(z > 0.7) = 0.7;
z(z < -.7) = -0.7;
surf(z); % show the mesh of z
>>>>>>> 542a0a8303d7514c52d858d6ed680356c059c9eb
'