
%///////1 step read image///////
img = imread('h4.tif');
subplot(2,5,1);imshow(img);title('orginal image');
%/////// find size image to padding//////
[M, N] = size(img);
P = 2 * M;
Q = 2 * N;

img = im2double(img);
pimg = zeros(P, Q);
pimg(1:M, 1:N) = img(1:M, 1:N);
subplot(2,5,2);imshow(pimg);title('padding image');

% ///////Multiply -1^(x+y) image after padding///
for x = 1:P
    for y = 1:Q
        pimg(x, y) = pimg(x, y) .* (-1)^(x+y);
    end
end
subplot(2,5,3);imshow(pimg);title('padding image Multiply -1^(x+y)');
% //////compute Fourier Transform /////
pimg = fft2(pimg);
subplot(2,5,4);imshow(pimg);title('Fourier Transform');
% /// Prepare the filter  ///

r = 40;
H = ones(P, Q);
for x = 1:P
    for y = 1:Q
        d = sqrt((x-P/2)^2 + (y-Q/2)^2);
        if d > r
            H(x, y) = 0;
        else
            H(x, y) = 1;
        end

    end
end
subplot(2,5,5);imshow(H);title('filter');
% ////multiply  image by filter////
imgBF = pimg .* H;
subplot(2,5,6);imshow(imgBF);title('multiply  image by filter');
% //// Compute the inverse Fourier transform/////
imgbf = ifft2(imgBF);
imgbf = real(imgbf);
subplot(2,5,7);imshow(imgbf);title('inverse Fourier transform');
% /////Multiply the result by (-1)x+y ////
for x = 1:P
    for y = 1:Q
        imgbf(x, y) = imgbf(x, y) .* (-1)^(x+y);
    end
end
subplot(2,5,8);imshow(imgbf);title('inverse Fourier transform multiply -1^(x+y)');
% ////remove padding/////
imgo = imgbf(1:M, 1:N);
subplot(2,5,9);imshow(imgo);title('result image');
