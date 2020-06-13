oimg=imread('as.jpg');
im1=im2double(oimg);
im2=imadjust(im1);
si=size(im1);
add=[0;0];
for i=1:si(1)
   for j=1:si(2)
       add(i,j)=im1(i,j)+im2(i,j);
   end
end

sub=[0;0];
for i=1:si(1)
   for j=1:si(2)
       sub(i,j)=im1(i,j)-im2(i,j);
   end
end

sum=0;
c=[0;0];
si2=size(im2);

C=zeros(si(1),si2(2));
for ii=0:si(1)
        for jj=0:si2(2)
            for p=0:si(2)
                
                C(ii,jj)=C(ii,jj)+ im1(ii,p)*im2(p,jj);
            end            
        end
 end

mul0= immultiply(im1,im2);
div= imdivide(im1,im2);

% subplot(5,2,1);imshow(im1),title('original');
% subplot(5,2,2);imshow(im2),title('After modification');
% subplot(5,2,3);imshow(add),title('add');
% subplot(5,2,4);imshow(sub),title('Subtract');
% subplot(5,2,5);imshow(mul),title('multiply');
% subplot(5,2,6);imshow(div),title('divide');

%////// //////////////////////////////
%  oimg=imread('logg.tif');
%  figure
%  iml=im2double(oimg);
%  logz=3*log2(1+iml);
%  
% 
%   subplot(1,2,1);imshow(iml),title('original');
%   subplot(1,2,2);imshow(logz),title('Log Transformations');
%  
%  %////////////
%  exim =imread('aq.tif');
%  in=im2double(exim);
%  i=in.^0.5;
%  
%  subplot(5,2,9);imshow(in),title('original');
%  subplot(5,2,10);imshow(i),title('Power-Law Transformations');
 
