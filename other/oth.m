ima=imread('Fig0235(c)(kidney_original).tif');
ins=im2double(ima);


fil=1/9*[1 1 1;1 1 1;1 1 1];
r3=myfilter(ima,fil);

r3=round(r3);
im=joint_histogram(uint8(ima),uint8(r3));
 min=cdff(im,ima(1,1)+1,r3(1,1)+1);
for i=1:size(ima,1)
    for j=1:size(ima,2)
        temp=cdff(im,ima(i,j)+1,r3(i,j)+1);
        if (temp<min)
            min=temp;
        end
    end
end
imfinal=zeros(size(ima));
si=size(ima);
si=(si(1)*si(2))-1;
for i=1:size(ima,1)
    for j=1:size(ima,2)
        temp=cdff(im,ima(i,j)+1,r3(i,j)+1);
        imfinal(i,j)=round(((cdff(im,ima(i,j)+1,r3(i,j)+1)-min)/si)*255);
    end
end
imshow(uint8(imfinal));