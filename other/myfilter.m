function [out] = myfilter(imag,fil)
sf=(size(fil)-1)/2;

if sf(1)~=sf(2)
    disp("please enter filter row and col is equal");
elseif mod(sf(1),2)==0
    disp("please enter odd filter");
    return;  
else
convv=con(imag);
s=size(imag);

if sf(1)>1
    for i=1:sf(1)-1
        convv=con(convv);
    end 
    
end
r=zeros(s);
so=size(convv);
for i = sf(1)+1:(so(1)-sf(1))
    for j = sf(1)+1:(so(2)-sf(1))
        temp = convv(i-sf(1):i+sf(1),j-sf(1):j+sf(1)) .* fil;
        r(i-sf(1),j-sf(1)) = sum(temp(:));
    end
end
out=r;
end

end

