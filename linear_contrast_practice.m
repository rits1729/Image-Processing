img=imread('baboon.jpg');
gimg=rgb2gray(img);
n=size(gimg);
new_gimg=gimg;
a=(double)(min(min(gimg)));
b=(double)(max(max(gimg)));
c=(double)(input("Enter the lower Limit: "));
d=(double)(input("Enter the upper Limit: "));
f=(d-c)/(b-a);
for i=1:n(1)
  for j=1:n(2)
    new_gimg(i,j)=((new_gimg(i,j)-a)*f)+c;
  endfor
endfor
subplot(2,1,1),imshow(gimg);
subplot(2,1,2),imshow(new_gimg);