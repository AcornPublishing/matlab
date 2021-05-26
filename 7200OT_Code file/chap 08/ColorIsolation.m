function [output] = ColorIsolation(image,thresh)

% Function for color isolation in an image % Inputs:
%        image  - Input image
%        thresh - Thresholds matrix ([1st 2nd 3rd])
% Output:   
%        output - Output image (masked)

R = image(:,:,1);	% Separate red channel
G = image(:,:,2);	% Separate green channel
B = image(:,:,3);	% Separate blue channel

% Create mask from three thresholds
mask = R < thresh(1) | G < thresh(2) | B < thresh(3);

% Perform masking 
R(mask==0) = R(mask==0);
G(mask==0) = R(mask==0);
B(mask==0) = R(mask==0);

% Join color channels to generate final image
output = cat(3,R,G,B);

