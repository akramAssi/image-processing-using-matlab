
img=im2double(imread('Fig0526(a)(original_DIP).tif'));
subplot(1,2,1);
imshow(img);title('original image');
[m,n]=size(img);

%Blur the image
h = fspecial('motion', 13, 45);
im_blurred = imfilter(img, h, 'conv', 'circular');

%Add noise
mean = 0;
v = 0.01;
im_blur = imnoise(im_blurred,'gaussian',0,v);

%FFT of filter
H=fft2(h,m,n);
%FFT of Distorted[Blurred] image
G=fft2(im_blur);




H_func = abs(H).^2;
fraction = H_func./(H.*((abs(H).^2)+1));
temp = G.*fraction;
temp2=ifft2(temp);
restoredImage=abs(temp2);
subplot(1,2,2);
imshow(temp2,[]);
