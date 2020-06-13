
img =imread('Fig0503 (original_pattern).tif');
figure;
subplot(1,3,1);
imshow(img);
title('original image');


gnoise = imnoise(img, 'gaussian', 0.2, 0.01);
subplot(1,3,2);
imshow(gnoise);
title('Plus gaussian noise');


pnoise = imnoise(img, 'salt & pepper', 0.2);
subplot(1,3,3);
imshow(pnoise);
title('Plus salt & pepper noise');
