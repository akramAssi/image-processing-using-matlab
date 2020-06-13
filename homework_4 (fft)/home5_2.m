img = imread('Fig0503 (original_pattern).tif');
figure;
subplot(1,3,1);
imshow(img);
title('original image');


img_n = imnoise(img, 'salt & pepper', 0.2);
subplot(1,3,2);
imshow(img_n);
title('image with salt & pepper noise');
 
img_f = medfilt2(img_n);
subplot(1,3,3);
imshow(img_f);
title('image through median filter');