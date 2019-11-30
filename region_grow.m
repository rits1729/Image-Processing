img=imread('camera.jpg');
img_copy=img;
n=size(img_copy);
seed=input("Enter the seed value: ");
thresh=input("Enter the threshold value: ");
for i=1:n(1)
  for j=1:n(2)
    diff=seed-img(i,j);
    if diff<0
      diff=diff*(-1);
     
    endif
    if diff>thresh
      img_copy(i,j)=255;
    endif
  endfor
endfor
imshow(img_copy);