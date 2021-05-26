function [output] = Motion(input,len,theta)

% Function that performs motion blurring on a user defined 
% ROI,using the motionkernel. The effect resembles a local motion.
% Inputs:
%        input  - Input image
%        len    – User's choice of length for the motion in pixels
%        theta  – User's choice of angle for the motion in degrees
% Output:   
%        output - Output image (only user-defined ROI appears to move)
 
kernel = fspecial('motion',len,theta);  % Create motion kernel
disp('Select area to appear in motion!')   % Display message to user
mask = roipoly(input);           % User selects area of interest      
output = [];                     % Start with an empty image
for i = 1:size(input,3)          % Covering the case of color images 
    cropped = input(:,:,i);      % Perform per-channel processing
    channel = input(:,:,i);             % Replica of channel
    cropped(mask == 0) = 0;             % Keep only ROI inside mask
    cropped = imfilter(cropped,kernel); % Perform blurring out of ROI
    channel(mask==1) = cropped(mask==1); % Only keep ROI affected 
    output = cat(3,output,channel);  % Concatenate channels
end 


