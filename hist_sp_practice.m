img=imread('baboon.jpg');
gimg=rgb2gray(img);
img_copy=gimg;
n=size(gimg);
b=zeros(256,1);
for i=1:n(1)
  for j=1:n(2)
    val=gimg(i,j);
    b(val+1,1)+=1;
  endfor
endfor
sum1=0;
for i=1:256
  sum1+=b(i,1);
endfor
for i=1:256
  b(i,1)=b(i,1)/sum1;
endfor
for i=2:256
  b(i,1)=b(i,1)+b(i-1,1);
endfor
for i=1:256
  b(i,1)=255*b(i,1);
  b(i,1)=(uint8)(b(i,1));
endfor
c=zeros(256,1);
for i=1:n(1)
  for j=1:n(2)
    val2=b(gimg(i,j)+1,1);
    c(val2+1,1)+=1;
  endfor
endfor
%For 2 IMage
img2=imread('camera.jpg');
m=size(img2);
d=zeros(256,1);
for i=1:m(1)
  for j=1:m(2)
    val=img2(i,j);
    d(val+1,1)+=1;
  endfor
endfor
sum2=0;
for i=1:256
  sum2+=d(i,1);
endfor
for i=1:256
  d(i,1)=d(i,1)/sum2;
endfor
for i=2:256
  d(i,1)=d(i,1)+d(i-1,1);
endfor
for i=1:256
  d(i,1)=255*d(i,1);
  d(i,1)=(uint8)(d(i,1));
endfor
e=zeros(256,1);
for i=1:m(1)
  for j=1:m(2)
    val3=d(img2(i,j)+1,1);
    e(val3+1,1)+=1;
  endfor
endfor
%Histogram Specification
for i=1:256
  val6=b(i,1);
  for j=1:256
    if val6<=c(j,1)
      index=j;
      break;
    endif
  endfor
  b(i,1)=index;
endfor
f=zeros(256,1);
for i=1:n(1)
  for j=1:n(2)
    val7=img_copy(i,j)+1;
    pix=b(val7,1);
    img_copy(i,j)=pix-1;
    f(pix+1,1)=f(pix+1,1);
  endfor
endfor
subplot(2,3,1),imshow(gimg);
subplot(2,3,2),imshow(img2);
subplot(2,3,3),imshow(img_copy);
subplot(2,3,4),bar(c);
subplot(2,3,5),bar(e);
subplot(2,3,6),bar(f); 

