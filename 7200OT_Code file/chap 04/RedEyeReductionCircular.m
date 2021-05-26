function output = RedEyeReductionCircular(input, thresh, radii) 

% Function for red eye reduction in input image 
% Inputs:
%        input - Input image
%        thresh – Threshold value in channel a*
%        radii – 2x1 matrix with lowest and highest radius
% Output:   
%        output - Output image (after red-eye reduction)

cform = makecform('srgb2lab'); % Make the transform structure
img_lab = applycform(input,cform); % Apply transform to L*a*b*

a = img_lab(:,:,2); % Isolate a* channel
[I,r] = imfindcircles(a,radii); % Detect circles in ROI

mask = zeros(size(a)); % Make a mask full of zeros

if size(I,1) ~= 2	% If we don't detect a pair of eyes
	disp('No pair of eyes detected in ROI!')
else
    mask(round(I(1,2)),round(I(1,1)))=1;		% First eye center
    mask(round(I(2,2)),round(I(2,1)))=1;		% Second eye center
end

average_radius = round((r(1)+r(2))/2); % Find average eye radius
mask = imdilate(mask,strel('disk',average_radius)); % Enlarge ROIs
mask = (mask > 0) & a > thresh;   % Keep pixels with high a* values 
% Split the three color channels
R=input(:,:,1);
G=input(:,:,2);
B=input(:,:,3);

R(mask) = round((G(mask)+B(mask))/2); % Replace R value with (G+B)/2

output = cat(3,R,G,B); % Join color channels to form output image
