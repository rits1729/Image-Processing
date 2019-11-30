img=imread('camera.jpg');
gimg=img;
img_copy=gimg;
n=size(gimg);
gimg=im2double(gimg);
for i=1:n(1)
  for j=1:n(2)
    gimg(i,j)=(2*log(1+gimg(i,j)));
    gimg(i,j)=255*gimg(i,j);
    gimg(i,j)=(uint8)(gimg(i,j));
  endfor
endfor
subplot(1,2,1),imshow(img_copy),title("Original Image");
subplot(1,2,2),imshow(gimg),title("Log Transformation Image");