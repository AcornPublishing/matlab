img = imread('my_image.bmp');		% Read image
subplot (1,2,1)				% Open a figure for 2 images
imshow(img)				% Show original image
title ('Original image')		% Add title
threshold = 150; 			% Set threshold level
img(img > 150) = 255;			% Set pixels above 150 to 255
img(img <= 150) = 0;			% Set pixels below 150 to 0
img = logical(img);
subplot (1,2,2)				% Make second image spot active
imshow(img)				% Show thresholded image
title ('Thresholded image')		% Add title
