img=imread('camera.jpg');
gimg=(img);
c=cell(1,8);
n=size(gimg);
for i=1:n(1)
  for j=1:n(2)
    b=gimg(i,j);
    if b>=128
      b=b-128;
      c{1,1}(i,j)=1;
    else
      c{1,1}(i,j)=0;
    endif
    if b>=64
      b=b-64;
      c{1,2}(i,j)=1;
    else
      c{1,2}(i,j)=0;
    endif
    if b>=32
      b=b-32;
      c{1,3}(i,j)=1;
    else
      c{1,3}(i,j)=0;
    endif
    if b>=16
      b=b-16;
      c{1,4}(i,j)=1;
    else
      c{1,4}(i,j)=0;
    endif
    if b>=8
      b=b-8;
      c{1,5}(i,j)=1;
    else
      c{1,5}(i,j)=0;
    endif
    if b>=4
      b=b-4;
      c{1,6}(i,j)=1;
    else
      c{1,6}(i,j)=0;
    endif
    if b>=2
      b=b-2;
      c{1,7}(i,j)=1;
    else
      c{1,7}(i,j)=0;
    endif
    if b>=1
      b=b-1;
      c{1,8}(i,j)=1;
    else
      c{1,8}(i,j)=0;
    endif
  endfor
endfor
for i=1:n(1)
  for j=1:n(2)
    
  endfor
endfor
f1=c{1,1};
f2=c{1,2};
f3=c{1,3};
f4=c{1,4};
f5=c{1,5};
f6=c{1,6};
f7=c{1,7};
f8=c{1,8};

subplot(2,4,1),imshow(f1),title('Bitplane8');
subplot(2,4,2),imshow(f2),title('Bitplane7');
subplot(2,4,3),imshow(f3),title('Bitplane6');
subplot(2,4,3),imshow(f4),title('Bitplane5');
subplot(2,4,5),imshow(f5),title('Bitplane4');
subplot(2,4,6),imshow(f6),title('Bitplane3');
subplot(2,4,7),imshow(f7),title('Bitplane2');
subplot(2,4,8),imshow(f8),title('Bitplane1');