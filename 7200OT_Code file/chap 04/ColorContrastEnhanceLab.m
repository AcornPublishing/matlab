function output = ColorContrastEnhanceLab(input, method) 

% Function for color contrast enhancement of input image in L*a*b* 
% Inputs:
%        input  - Input image
%        method – Enhancement method selection (0: histeq
%                                               1: adapthisteq
%							     2: imadjust)
% Output:   
%        output - Output image (enhanced)

cform = makecform('srgb2lab'); % Make the transform structure
img_lab = applycform(input,cform); % Apply transform to L*a*b*

switch method

% Apply chosen method in the Lightness channel (img_lab(:,:,1))

	case 0
img_lab (:,:,1) = histeq(img_lab (:,:,1));
	case 1
		img_lab (:,:,1) = adapthisteq(img_lab (:,:,1));
	case 2
		img_lab (:,:,1) = imadjust(img_lab (:,:,1));
end

cform = makecform('lab2srgb'); % Make the inverse transform structure
output = applycform(img_lab, cform); % Apply transform to RGB
