function [output] = CroppedContrastEnhancement(input,method)
 
% Function that performs area-based image contrast enhancement with 
% methods incorporated in Matlab toolboxes
% Inputs:
%           input - Input image
%           method - Enhancement method (1: histeq, 2: imadjust, 
%                                        3: adapthisteq)
% Output:   
%           output - Output image (with enhanced contrast)
 
[cropped,roi] = imcrop(input);	  % Crop input image
switch method
    case 1
        cr_en = histeq(cropped);	  % Apply hist. equalization
    case 2
        cr_en  = imadjust(cropped);    % Apply image adjustment
    case 3
        cr_en  = adapthisteq(cropped); % Apply clahe
end

input(roi(2):roi(2)+roi(4),roi(1):roi(1)+roi(3)) = cr_en;
output = input;
