%-------------------高斯低通滤波器----------------------%
function H = gaussian_low_pass(img,D0)
% img为输入图像，D0时截止频率
[M,N] = size(img);
H = zeros(2*M,2*N);
 
for u = 1:2*M
    for v = 1:2*N
        D_square = (u-M) * (u-M) + (v-N) * (v-N); 
        H(u,v) = exp(-D_square/(2*D0*D0));        
    end
end
end