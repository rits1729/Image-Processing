img=imread('camera.jpg');
gimg=(img);
n=size(gimg);
img_copy=gimg;
musk=gimg;
for i=1:n(1)
  for j=1:n(2)
    if i>94 && i<=134 && j>89 &&j<=140
      musk(i,j)=255;
    else
      musk(i,j)=0;
    endif
  endfor
endfor
for i=1:n(1)
  for j=1:n(2)
    img_copy(i,j)=and1(musk(i,j),gimg(i,j));
  endfor
endfor
imshow(img_copy);