img = imread('my_image.bmp');		% Read image
subplot (1,2,1)				% Open a figure for 2 images
imshow(img)				% Show original image
title ('Original image')		% Add title
threshold = 150; 			% Set threshold level
for i = 1:size(img,1)			% For all rows
	for j = 1:size(img,2)		% For all columns
		if img(i,j) > threshold	% Check pixel value
			img(i,j) = 255;	% Set pixels above 150 to 255
		else
			img(i,j) = 0;		% Set pixels below 150 to 0
        end				% End if
    end					% End columns for loop
end 					% End rows for loop
subplot (1,2,2)				% Make second image spot active
imshow(img)				% Show thresholded image
title ('Thresholded image')		% Add title
