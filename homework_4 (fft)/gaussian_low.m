    

img = imread('Fig0441(a)(characters_test_pattern).tif');
[M, N] = size(img);
P = 2 * M;
Q = 2 * N;
 
d0 = 100;
H = zeros(P, Q);
for i = 1:P
    for j = 1:Q
        H(i, j) = exp(-((i-P/2)^2 + (j-Q/2)^2) / (2 * d0^2));
    end
end
subplot(2,3,1);imshow(img);title ('Original Image');
subplot(2,3,2);imshow(H);title ('filter');
subplot(2,3,3);imshow(myfft2(img,H),[]);title ('Gaussian low-pass filtered image');

subplot(2,3,4);imshow(img);title ('Original Image');
subplot(2,3,5);imshow(1-H);title ('filter');
subplot(2,3,6);imshow(myfft2(img,1-H));title ('Gaussian higePass filtered image');

