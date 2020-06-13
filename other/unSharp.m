function out= unSharp(img)
avg=1/9*[ 1 1 1;1 1 1 ;1 1 1];
bimag=myfilter(img,avg);
sub=img-bimag;
out=img+sub;
end

