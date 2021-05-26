img = imread('my_image.bmp');
img_eq = histeq(img);
img_adj = imadjust(img);
subplot(2,3,1),imshow(img),title('Original Image');
subplot(2,3,2),imshow(img_eq),title('Equalized Image');
subplot(2,3,3),imshow(img_adj),title('Adjusted Intensity Image');
subplot(2,3,4),imhist(img,64),title('Original Image Histogram');
subplot(2,3,5),imhist(img_eq,64),title('Equalized Image Histogram');
subplot(2,3,6),imhist(img_adj,64),title('Adjusted Image Histogram');
