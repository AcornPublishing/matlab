function DenoiseAndPlot(original,distorted,type)

% Function that performs filtering of the distorted image with % three different kernels and displays the results
% Inputs:
%      original  - Original image
%      distorted – Image distorted by noise
%      type      – Type of noise 
%	    (1: Gaussian, 2: Poisson, 3: speckle, 4: Salt & Pepper)

switch type 
	case 1
		message = 'Noisy image (Gaussian)';
	case 2
		message = 'Noisy image (Poisson)';
	case 3
		message = 'Noisy image (speckle)';
	case 4
		message = 'Noisy image (Salt & Pepper)';
end
f1 = BlurImage(distorted,1,2,1); 
f2 = BlurImage(distorted,2,[5,5],1);
f3 = BlurImage(distorted,3,[5,5,2],1);
subplot(2,3,1),imshow(original),title('Original image')
subplot(2,3,2),imshow(distorted),title(message)
subplot(2,3,4),imshow(f1),title('Filtered by disk kernel')
subplot(2,3,5),imshow(f2),title('Filtered by averaging kernel')
subplot(2,3,6),imshow(f3),title('Filtered by Gaussian kernel')
