% Aim of this code - To understand unitary transformations and SVD
% author - Jishnu Goswami, MS Engg., EMU

% adopted from Steve brunton's youtube lecture
% link to the lecture - https://www.youtube.com/watch?v=_wOt50VnJw4&list=PLMrJAkhIeNNSVjnsviglFoY2nXildDCcv&index=12

%% Unitary transformations
% Here we will take a known unitary matrix to show the transformation

% defining the angle of transformation
theta1 = pi/15 ;
theta2 = -pi/9 ;
theta3 = -pi/20 ;

% Rotation matrix for transformation about x-axis
Rx = [1 0 0;
    0 cos(theta1) -sin(theta1);
    0 sin(theta1) cos(theta1)] ;

% Rotation matrix for transformation about y-axis
Ry = [cos(theta2) 0 sin(theta2);
    0 1 0;
    -sin(theta2) 0 cos(theta2)] ;

% Rotation matrix for transformation about z-axis
Rz = [cos(theta3) -sin(theta3) 0;
    sin(theta3) cos(theta3) 0;
    0 0 1] ;

% Defining the diagonal matrix containing singular values
sigma = diag([3;1;0.5]) ;  % this is a stretching and squeezing matrix

R = Rx*Ry*Rz*sigma ;

%% Visualizing the transformation
[x,y,z] = sphere(250) ;