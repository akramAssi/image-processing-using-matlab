ima=imread('Fig0914(a)(licoln from penny).tif');

BW =ones(9,10);
BW(4:6,4:7)=0;
% BW=[0 0 0 1 0;0 1 1 0 1;0 1 0 1 0;0 1 0 1 0];
% BW= abs(1-BW);
se=strel('disk',1);
% se=[0 1 0;1 1 1 ;0 1 0];
bs=imdilate(~BW,se);
bs=imerode(ima,se);
bs=imdilate(bs,se);


bs=imdilate(bs,se);
bs=imerode(bs,se);

% bs=~bs;
subplot(1,2,1);imshow(ima);
subplot(1,2,2); 
imshow(bs);