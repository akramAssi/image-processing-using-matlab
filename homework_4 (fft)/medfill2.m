function [out] = midfilter(imag,fil)

sf=(fil-1)/2;

convv=con(imag);
s=size(imag);

if sf>1
    for i=1:sf-1
        convv=con(convv);
    end 
    
end
r=zeros(s);
so=size(convv);
for i = sf+1:(so(1)-sf)
    for j = sf+1:(so(2)-sf)
        temp = convv(i-sf:i+sf,j-sf:j+sf);
        temp=sort(temp(:));
        r(i-sf,j-sf) = temp((fil*fil+1)/2);
    end
end
out=r;
end



