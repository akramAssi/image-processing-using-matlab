function img_out = FFT_2D(img,D0)
% 说明：img为输入图像，D0时截止频率，img_out为二维傅里叶变换后的图像
[M,N] = size(img);
img = double(img);
 
% 填充图像
P = 2 * M;
Q = 2 * N;
img_fill = zeros(P,Q);    
for m = 1:M
    for n = 1:N
        img_fill(m,n) = img(m,n);
    end
end
 
% (1.a)用因子(-1)^(x+y) 乘以输入图像，以实现滤波的中心化变换
img_shift = zeros(P,Q);
for p = 1:P
    for q = 1:Q
         img_shift(p,q) = power(-1,p+q) * img_fill(p,q);
    end
end
% (1.b)计算傅里叶变换
F_img = fft2(img_shift);
 
% (1.c)用一个实矩阵乘以一个复数矩阵，使用高斯低通滤波器        
H = gaussian_low_pass(img,D0);                                  
Y = H.* F_img;
 
% (1.d)计算反傅里叶变换
y = ifft2(Y);
 
% (1.e)结果乘以(-1)^(x+y)，并取其实部
for p = 1:P
    for q = 1:Q
        y(p,q) = power(-1,p+q) * y(p,q);
        y(p,q) = real(y(p,q));
    end
end
y = uint8(y);
 
% 输出图像
img_out = zeros(M,N);
for m = 1:M
    for n = 1:N
        img_out(m,n) = y(m,n);
    end
end
img_out = uint8(img_out);
 
% (1.f)计算频谱
F_y = fftshift(fft2(y));
 
% (1.g)计算图4.41(a)的中心化后的傅里叶谱；
FF_img = fftshift(fft2(img));
 
% 频域滤波步骤过程的图像
figure;
subplot(2,3,1);imshow(img);title('图(a):输入原图像');
subplot(2,3,2);imshow(img_fill);title('图(b):填充2M×2N的图像');
subplot(2,3,3);imshow(img_shift);title('图(c):乘以(-1)的(x+y)次方');
subplot(2,3,4);imshow(F_img);title('图(d):傅里叶变换频谱');
subplot(2,3,5);imshow(abs(H),[]);title('图(e):实矩阵乘以一个复数矩阵');
subplot(2,3,6);imshow(img_out);title('图(f):输出图像');
 
% 使用二维图像和三维图形两种形式显示计算的幅度谱和相位谱
figure;
subplot(2,2,1);imshow(abs(FF_img),[]);colormap hot;title('图(a):二维幅度谱');
subplot(2,2,2);imshow(angle(FF_img));colormap hot;title('图(b):二维相位谱');
subplot(2,2,3);mesh(1:M,1:N,abs(FF_img));colormap hot;title('图(c):三维幅度谱');
subplot(2,2,4);mesh(1:M,1:N,angle(FF_img));colormap hot;title('图(d):三维相位谱');
 
end