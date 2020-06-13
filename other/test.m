ima=imread('po.tif');
% ima=rgb2gray(ima);
ima=im2double(ima);

fil=1/81*[
    
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1];

imshow(unSharp(ima));
figure;
fsbx=[-1 0 1;-2 0 2; -1 0 1];
sbx=myfilter(ima,fsbx);
fsby=[-1 -2 -1;0 0 0; 1 2 1];
sby=myfilter(ima,fsby);

sbx=sbx.^2;
sby=sby.^2;
sb1=sqrt(sbx+sby);
imsp=ima-sb1;

flab=[0 1 0 ;1 -4 1; 0 1 0 ];
lap=myfilter(ima,flab);
lap2=myfilter(lap,flab);
imlap=ima-3*lap;

subplot(1,3,1);imshow(ima),title('original');
subplot(1,3,2);imshow(sb1),title('Sobel3*3');
subplot(1,3,3);imshow(lap2),title('Laplacian 3*3');
