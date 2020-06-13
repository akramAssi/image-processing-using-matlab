ima=imread('Fig0235(c)(kidney_original).tif');
ins=im2double(ima);


fil=1/9*[1 1 1;1 1 1;1 1 1];
r3=myfilter(ima,fil);

r3=round(r3);
im=joHi(uint8(ima),uint8(r3),256);

f=1;
s=zeros(10,5);
for i=1:256
    for j=1:256
        if im(i,j)~=0
            s(f,1)=i-1;
            s(f,2)=j-1;
            s(f,3)=im(i,j);
            f=f+1;
        end
    end
end

for i=2:size(s,1)
     if s(i-1,1)>s(i,1)
         temp=s(i,1:5);
         s(i-1,1:5)=s(i,1:5);
         s(i,1:5)=temp;
     end

end
s(1,4)=s(1,3);
for ii=2:size(s,1)
     s(ii,4)=s(ii-1,4)+s(ii,3);

end
si=size(ima);
si=(si(1)*si(2))-1;

for ii=1:size(s,1)
     s(ii,5)=round(((s(ii,4)-s(1,4))/si)*255);

end


sizim=size(ima);
final=int32(zeros(sizim));
for i=1:sizim(1)
    for j=1:sizim(2)
        final(i,j)=256*int32(ima(i,j))+int32(r3(i,j));
    end
end

for i=1:size(s,1)
    s(i,6)=256*int32(s(i,1))+int32(s(i,2));
end

for i=1:sizim(1)
    for j=1:sizim(2)
%         disp(final(i,j)+" "+i+j);
        r=find(s(:,6) == final(i,j));
        final(i,j)=s(r,5);
    end
end

imshow(uint8(final));