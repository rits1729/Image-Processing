img=imread("baboon.jpg");
gimg=rgb2gray(img);
img_copy=gimg;
s=gimg;
n=size(gimg);
b=zeros(256,1);
for i=1:n(1)
  for j=1:n(2)
    val=gimg(i,j);
    b(val+1,1)+=1;
  endfor
endfor
e=b;
sum1=0;
for i=1:256
  sum1=sum1+b(i,1);
endfor
for i=1:256
  b(i,1)=b(i,1)/sum1;
endfor
for i=2:256
  b(i,1)=b(i,1)+b(i-1,1);
endfor
for i=1:256
  b(i,1)=b(i,1)*255;
  b(i,1)=(uint8)(b(i,1));
endfor
c=zeros(256,1);
for i=1:n(1)
  for j=1:n(1)
    val1=b(gimg(i,j)+1,1);
    c(val1+1,1)+=1;
  endfor
endfor
for i=1:n(1)
  for j=1:n(2)
    s(i,j)=b(gimg(i,j)+1,1);
  endfor
endfor
subplot(2,2,1),imshow(img_copy);
subplot(2,2,2),bar(e);
subplot(2,2,3),imshow(s);
subplot(2,2,4),bar(c);