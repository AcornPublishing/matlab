function [output] = CroppedDilationErosion(input,se,method)
 
% Function that performs area-based dilation or erosion with 
% a user-defined structuring element.
% Inputs:
%           input -  Input image
%		  se –     Structuring element	
%           method – Morphology operation (1: dilation, 2: erosion)
% Output:   
%           output - Output image (dilated or eroded)

[cropped,roi] = imcrop(input);	  % Crop input image
switch method
    case 1
        cr_en = imdilate(cropped,se);	  % Apply dilation
    case 2
        cr_en  = imerode(cropped,se);    % Apply erosion
end
input(roi(2):roi(2)+roi(4),roi(1):roi(1)+roi(3)) = cr_en;
output = input;
