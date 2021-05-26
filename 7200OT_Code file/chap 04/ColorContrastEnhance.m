function output = ColorContrastEnhance(input, method) 

% Function for color contrast enhancement of input image 
% Inputs:
%        input  - Input image
%        method – Enhancement method selection (0: histeq
%                                               1: adapthisteq
%							     2: imadjust)
% Output:   
%        output - Output image (enhanced)
output = input;
switch method
	case 0
		for i = 1:3
			output(:,:,i) = histeq(output(:,:,i));
		end
	case 1
for i = 1:3
			output(:,:,i) = adapthisteq(output(:,:,i));
		end
	case 2
for i = 1:3
			output(:,:,i) = imadjust(output(:,:,i));
		end
end
