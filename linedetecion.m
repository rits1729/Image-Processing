img=imread('camera.jpg');
gimg=(img);
img_box=gimg;
n=size(gimg);
d=input("Enter the filter size: ");
x=floor(d/2);
mask=zeros(1,d*d);
pad_value=zeros(1,d*d);
pad=zeros(n(1)+x+x,n(2)+x+x);
disp("Enter the musk value:");
for i=1:d*d
  mask(1,i)=input("Enter the element: ");
endfor
for i=1:n(1)
  for j=1:n(2)
    pad(i+x,j+x)=gimg(i,j);
  endfor
endfor
row_count=1;
col_count=1;
val=(d*d);
m=size(pad);
for i=x+1 :m(1)-x
  col_count=1;
  for j=x+1:m(2)-x
    index=1;
    s=0;
    for c1=i-x:i+x
      for c2=j-x:j+x
        pad_value(1,index)=mask(1,index)*pad(c1,c2);
        s=s+pad_value(1,index);
        index+=1;
      endfor
    endfor
    img_box(row_count,col_count)=floor(s);
    col_count+=1;
  endfor
  row_count+=1;
endfor
subplot(1,2,1),imshow(img),title("Original Image");
subplot(1,2,2),imshow(img_box),title("box_filter");