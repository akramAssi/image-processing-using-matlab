f=imread('Fig0441(a)(characters_test_pattern).tif');
F=fft2(f);
 
[M,N]=size(f);
s=0;
s=sum(sum(abs(F)));

ang=s/(M*N)

S=log(1+abs(F));
figure;plot(S);title('amplitude spectrum')
x=0:1:255;
y=0:1:255;
[x,y]=meshgrid(x,y);
figure;mesh(S);title('3d plot')
 

