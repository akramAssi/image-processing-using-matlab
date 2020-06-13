function h=joint_histogram(x,y)



x=int32(x);
y=int32(y);
rows=size(x,1);
cols=size(y,2);
N=256;

h=zeros(N,N);

for i=1:rows   
  for j=1:cols   
    h(x(i,j)+1,y(i,j)+1)= h(x(i,j)+1,y(i,j)+1)+1;
  end
end

end


