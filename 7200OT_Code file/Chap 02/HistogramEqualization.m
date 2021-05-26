img = imread('my_image.bmp');
img_eq = histeq(img);
subplot(2,2,1),imshow(img),title('Original Image');
subplot(2,2,2),imshow(img_eq),title('Equalized Image');
subplot(2,2,3),imhist(img,64),title('Original Image Histogram');
subplot(2,2,4),imhist(img_eq,64),title('Equalized Image Histogram');
