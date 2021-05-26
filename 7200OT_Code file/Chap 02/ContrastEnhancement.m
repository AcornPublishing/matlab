function [output] = ContrastEnhancement(input,method)

% Function that performs image contrast enhancement with methods
% incorporated in Matlab toolboxes
% Inputs:
%           input - Input image
%           method - Enhancement method (1: histeq, 2: imadjust, 
%                                        3: adapthisteq)
% Output:   
%           output - Output image (with enhanced contrast)

switch method
    case 1
        output = histeq(input);
    case 2
        output = imadjust(input);
    case 3
        output = adapthisteq(input);
        
end

        