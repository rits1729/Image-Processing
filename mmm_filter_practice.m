img=imread('baboon.jpg');
gimg=rgb2gray(img);
n=size(gimg);
filter_size=input("Enter the filter size: ");
if mod(filter_size,2)==0 || filter_size==1
  disp("ERROR : FILTER SIZE IS NOT APPROPRIATE");
endif
filter_mask=(uint8)(zeros(filter_size,filter_size));
padded_size=(double)(filter_size-1);
padded_gimg=(uint8)(zeros(padded_size+n(1),padded_size+n(2)));
padded_gimg(padded_size/2+1: (padded_size/2)+ n(1),padded_size/2+1: (padded_size/2) +n(2))=gimg;
%padded_gimg(padding_size/2 + 1 : n(1) + (padding_size/2), padding_size/2 + 1 : n(2) + (padding_size/2)) = gimg;

%Applying Filter
min_filter_gimg=(uint8)(zeros(n(1),n(2)));
max_filter_gimg=(uint8)(zeros(n(1),n(2)));
%median_filter_gimg=(uint8)(zeros(n(1),n(2)));
for i =1:n(1)
  for j=1:n(2)
    filtered_mask=padded_gimg(i:i+filter_size-1,j:j+filter_size-1);
    min_value=min(min(filter_mask));
    max_value=max(max(filter_mask));
    min_filter_gimg(i,j)=min_value;
    max_filter_gimg(i,j)=max_value;
  endfor
endfor
subplot(2,2,1),imshow(gimg),title("Original Image");
subplot(2,2,2),imshow(min_filter_gimg),title("Min Filter Image");
subplot(2,2,3),imshow(max_filter_gimg),title("MAx Filter Image");
%subplot(2,2,4),imshow(median_filter_gimg),title("Median Filter Image");