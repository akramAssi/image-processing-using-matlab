function cu = cdff(hi,r,c)
cu=0;
for i=1:r-1
    for j=1:256
        cu=cu+hi(i,j);
    end
end
for i=1:c
    cu=cu+hi(r,i);
end
end

