img = imread('my_image.bmp');
img_final = img;
img_final(1:30,1:40) = 255;
img_final(end-39:end,end-49:end) = 0;
subplot(1,2,1)
imshow(img)
title('Original image')
subplot(1,2,2)
imshow(img_final)
title('Processed image')

