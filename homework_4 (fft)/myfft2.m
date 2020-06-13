function imgo = myfft2(img,H)

[M, N] = size(img);
P = 2 * M;
Q = 2 * N;

img = im2double(img);
pimg = zeros(P, Q);
pimg(1:M, 1:N) = img(1:M, 1:N);


% ///////Multiply -1^(x+y) image after padding///
for x = 1:P
    for y = 1:Q
        pimg(x, y) = pimg(x, y) .* (-1)^(x+y);
    end
end


% //////compute Fourier Transform /////
pimg = fft2(pimg);


% ////multiply  image by filter////
imgBF = pimg .* H;

% //// Compute the inverse Fourier transform/////
imgbf = ifft2(imgBF);
imgbf = real(imgbf);

% /////Multiply the result by (-1)x+y ////
for x = 1:P
    for y = 1:Q
        imgbf(x, y) = imgbf(x, y) .* (-1)^(x+y);
    end
end

% ////remove padding/////
imgo = imgbf(1:M, 1:N);


end

