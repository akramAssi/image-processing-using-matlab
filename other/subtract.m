function img_out = subtract(img1,img2)
%img1为输入原图，img2为输入低通滤波图像，img_out输出的高通滤波图像
[M,N] = size(img1);
img_out = zeros(M,N);
 
for m = 1:M
    for n = 1:N
        img_out(m,n) = img1(m,n) - img2(m,n);
    end
end
img_out = uint8(img_out);
end