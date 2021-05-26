function [output] = ROIColorIsolation(input, thresh, cspace)
 
% Function for color isolation in a user-defined image ROI 
% Inputs:
%        input  - Input image
%        thresh - Thresholds matrix ([1st 2nd 3rd])
%        cspace - Color space for mask selection (0: RGB
%                                                 1: CIE-L*a*b*)
% Output:   
%           output - Output image (masked)
 
[mask] = roipoly(input);    % Crop input image

%Split channels
in1 = input(:,:,1); 
in2 = input(:,:,2); 
in3 = input(:,:,3); 
gray = rgb2gray(input); % Convert to grayscale for isolation
 
switch cspace
    case 0              % Case of RGB
        new_cs = input; % No change in input  
    case 1              % Case of CIE-L*a*b*
        cform = makecform('srgb2lab'); % Make the transform structure
        new_cs =  applycform(input,cform); % Apply transform
end
% Make mask for 1st channel
mask1 = new_cs(:,:,1);	% Assign 1st channel to mask1 
mask1(mask == 0) = 0;  % Make pixels outside ROI equal to 0 
mask1 = mask1 > thresh(1); % Apply 1st channel threshold
% Make mask for 2nd channel
mask2 = new_cs(:,:,2); % Assign 2nd channel to mask2 
mask2(mask == 0) = 0;  % Make pixels outside ROI equal to 0 
mask2 = mask2 > thresh(2); % Apply 2nd channel threshold
% Make mask for 3rd channel
mask3 = new_cs(:,:,3); % Assign 3rd channel to mask3 
mask3(mask == 0) = 0;  % Make pixels outside ROI equal to 0 
mask3 = mask3 > thresh(3); % Apply 3rd channel threshold

final_mask = mask1 & mask2 & mask3;	% Combine color channel masks

% Perform color isolation in each channel
in1(final_mask == 0) = gray(final_mask == 0);
in2(final_mask == 0) = gray(final_mask == 0);
in3(final_mask == 0) = gray(final_mask == 0);
% Join color channels to generate final image
output = cat(3,in1,in2,in3);
