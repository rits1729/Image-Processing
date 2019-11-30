img1=imread("baboon.jpg");
img=rgb2gray(img1);
img_copy=img;
n=size(img);
s=input("Enter the filter size: ");
musk=zeros(1,s*s);
x=floor(s/2);
for i=1:s*s
  musk(1,i)=input("Enter the musk value: ");
endfor
pad=zeros(n(1)+x+x,n(2)+x+x);
m=size(pad);
pad_value=zeros(1,s*s);
for i=1:n(1)
  for j=1:n(2)
    pad(i+x,j+x)=img(i,j);
  endfor
endfor
val=(s*s);
row_count=1;
col_count=1;
for i=x+1:m(1)-x
  col_count=1;
  for j=x+1:m(2)-x
    index=1;
    s1=0;
    for c1=i-x:i+x
      for c2=j-x:j+x
        pad_value(1,index)=musk(1,index)*pad(c1,c2);
        s1=s1+pad_value(1,index);
        index=index+1;
      endfor
    endfor
    img_copy(row_count,col_count)=floor(s/val);
    col_count+=1;
  endfor
  row_count+=1;
endfor
imshow(img_copy);