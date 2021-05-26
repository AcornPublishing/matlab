function [output] = FreehandMasking(input,method) 
 
% Function that performs masking of a user-defined ROI 
% Inputs:
%           input -  Input image
%           method – ROI selection (1: roipoly, 2: imfreehand)
% Output:   
%           output - Output image (masked)
 
switch method
    case 1
         mask = roipoly(input);           % Select ROI using roipoly
    case 2
         figure, imshow(input)
         h = imfreehand;			    % Select ROI using imfreehand	
         pos = wait(h); 
         [rows,columns] = size(input);
         mask = poly2mask(pos(:,1),pos(:,2),rows,columns); 
end
pix = impixel(input); 	% Select pixel with eraser color
output = input;
output(mask) = pix(1);	% Perform masking to erase selected object
