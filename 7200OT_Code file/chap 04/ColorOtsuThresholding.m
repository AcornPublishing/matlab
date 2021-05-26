img_color = imread('my_image_color.bmp');	% Load image
red = im2bw(img_color(:,:,1));		% Threshold red channel
green = im2bw(img_color(:,:,2));		% Threshold green channel
blue = im2bw(img_color(:,:,3));		% Threshold blue channel
bin_image_or = red | green | blue;		% Mix channels using OR
bin_image_and = red & green & blue;		% Mix channels using AND
subplot(1,3,1),imshow(img_color),title('Original Image')
subplot(1,3,2),imshow(bin_image_or),title('Binary Union Image')
subplot(1,3,3),imshow(bin_image_and),title('Binary Intersection Image')

