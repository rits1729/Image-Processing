img=imread("coin.jpg");
gimg=(img);
img_copy=gimg;
hist=zeros(256,1);
n=size(gimg);
for i=1:n(1)
  for j=1:n(2)
    val=gimg(i,j)+1;
    hist(val,1)=hist(val,1)+1;
  endfor
endfor
thresh=0;
new_thresh=130;
while abs(thresh-new_thresh) <0.01
  g1=0;
  g2=0;
  s1=0;
  s2=0;
  thresh=new_thresh;
  for i=1:n(1)
    for j=1:n(2)
      if gimg(i,j)<=new_thresh
        g1+=1;
        s1=s1+gimg(i,j);
      endif
      if gimg(i,j)>new_thresh
        g2+=1;
        s2=s2+gimg(i,j);
      endif
      
    endfor
  endfor
  if (g1+g2)~=(n(1)*n(2))
        display("Error");
        return;
  endif
  u1=(double)(g1/thresh);
  u2=(double)(g2/(255-thresh));
  new_thresh=round((u1+u2)/2);
endwhile
display(new_thresh);
for i=1:n(1)
  for j=1:n(2)
    if gimg(i,j)<=new_thresh
      gimg(i,j)=0;
    else
      gimg(i,j)=255;
    endif
  endfor
endfor
subplot(1,2,1),imshow(img_copy);
subplot(1,2,2),imshow(gimg);