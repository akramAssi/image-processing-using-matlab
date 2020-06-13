img = imread('Fig0526(a)(original_DIP).tif');
[M, N] = size(img);
figure;
subplot(2,3,1);
imshow(img);
title('Original image');


C = [343, 0];
[noise, R, S] = imnoise3(M, N, C, 40000000);
subplot(2,3,2);
imshow(noise, []);
title('noise');


img1 = double(img);
img2 = img1 + noise;
img3 = fft2(img2);
subplot(2,3,3);
imshow(img3);
title('Fourier transform');

d0 = 100;
P=M*2;
Q=N*2;
H = zeros(P, Q);
for i = 1:P
    for j = 1:Q
        H(i, j) = exp(-((i-P/2)^2 + (j-Q/2)^2) / (2 * d0^2));
    end
end

subplot(2,3,4);
imshow(H);
title('filter');


img_G =myfft2(img3,H);
subplot(2,3,5);
imshow(img_G);
title('Notch filtering in the frequency domain');

img_g = real(ifft2(img_G));
img_g = mat2gray(img_g);
subplot(2,3,6);
imshow(img_g);
title('Notch filter results');
