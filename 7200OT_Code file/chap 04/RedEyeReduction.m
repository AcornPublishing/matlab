function output = RedEyeReduction(input, thresh) 

% Function for red eye reduction in input image 
% Inputs:
%        input  - Input image
%        thresh – Threshold value in channel a*
% Output:   
%        output - Output image (after red-eye reduction)

cform = makecform('srgb2lab'); % Make the transform structure
img_lab = applycform(input,cform); % Apply transform to L*a*b*

eyes = roipoly(input);	% Select area of eyes
mask = (img_lab(:,:,2) > thresh) & (eyes > 0); % Red pixels in eyes

% Split the three color channels
R=input(:,:,1);
G=input(:,:,2);
B=input(:,:,3);

R(mask) = round((G(mask)+B(mask))/2); % Replace R value with (G+B)/2

output = cat(3,R,G,B); % Join color channels to form output image
