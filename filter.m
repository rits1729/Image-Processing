%Initialization
img = imread('baboon.jpg');
gimg = rgb2gray(img);
n = size(gimg);

%Defining Filter Properties
filter_size = (uint8)(input("Filter Size: "));
if mod(filter_size, 2) == 0 || filter_size == 1 %Sanity Check
  disp("ERROR: Incorrect Filter Size, Terminating Program.");
  return;
endif
filter_mask = (uint8)(zeros(filter_size, filter_size));
filter_coefficient = (double)(1);

disp("Input the Filter Matrix Values:")
for i = 1 : filter_size
  v = input("", 's');
  m = cellfun("str2num", strsplit(v, " "));
  print(m);
  if size(m) != filter_size %Sanity Check
    disp("ERROR: Invalid Filter Matrix Row Value, Terminating Program.");
    return;
  endif
  filter_mask(i, :) = m;
endfor

filter_coefficient = 1 / (double)(sum(sum(filter_mask)));

%Padding Image Before Applying Filter
padding_size = (double)(filter_size - 1);
padded_gimg = (uint8)(zeros(n(1) + padding_size, n(2) + padding_size));
padded_gimg(padding_size/2 + 1 : n(1) + (padding_size/2), padding_size/2 + 1 : n(2) + (padding_size/2)) = gimg;

%Applying Filter
disp("Status: Applying filter...");
filtered_gimg = (uint8)(zeros(n(1), n(2)));
for i = 1 : n(1)
  for j = 1 : n(2)
    pixel_value = (double)(0);
    for k = 1 : filter_size
      for l = 1 : filter_size
        pixel_value = pixel_value + ((double)(padded_gimg(i + k - 1, j + l - 1)) * (double)(filter_mask(k, l)));
      endfor
    endfor
    pixel_value = pixel_value * filter_coefficient;
    filtered_gimg(i, j) = (uint8)(pixel_value);
  endfor
endfor
disp("Status: Done!");

%Displaying Results
subplot(1, 2, 1), imshow(gimg)
subplot(1, 2, 2), imshow(filtered_gimg)