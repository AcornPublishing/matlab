function [output] = BlurImage(input,kernel_choice,kernel_size,method)

% Function for image blurring 
% Inputs:
%        input - Input image
%        kernel_choice – User's choice of filter
%				 (1: disk
%				  2: average
%				  3: gaussian)
%        kernel_size – User's choice of kernel size 
%                   ([radius] for disk, 
%			    [rows, columns] for average,
%			    [rows, columns, standard deviation] for Gaussian)	  
%        method – User's choice of filtering method
%			 (1: correlation
%			  2: convolution)
% Output:   
%        output - Output image (after bluring)
 
switch kernel_choice
	case 1
		kernel = fspecial('disk',kernel_size);
    case 2
		kernel = fspecial('average',kernel_size);
    case 3
		kernel = fspecial('gaussian',kernel_size(1:2),kernel_size(3));
end

switch method
	case 1
		output = imfilter(input,kernel,'conv');
	case 2
		output = imfilter(input,kernel,'corr');
end
