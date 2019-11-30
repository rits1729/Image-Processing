img=imread('baboon.jpg')
gimg=rgb2gray(img);
musk=gimg;
n=size(gimg);
for i=1:n(1)
  for j=1:n(2)
    if i>94 && i<130 && j>80 && j<150
      musk(i,j)=255;
    else
      musk(i,j)=0;
    endif
  endfor
endfor
for i=1:n(1)
  for j=1:n(2)
    o(i,j)=bit_and(musk(i,j),img(i,j));
  endfor
endfor
imshow(o);
  
