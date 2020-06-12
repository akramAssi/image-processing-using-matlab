function joHi= joHi(olim,avim,level)
os=size(olim);
as=size(avim);
olim=int32(olim);
avim=int32(avim);

joHi=zeros(level,level);

for i=1:os(1)   
  for j=1:as(2) 
    joHi(olim(i,j)+1,avim(i,j)+1)= joHi(olim(i,j)+1,avim(i,j)+1)+1;
  end
end

end

