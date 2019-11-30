% Initialization
img = imread('baboon.jpg');
n = size(img);
gimg = img;

% Checking image channels and converting to grayscale if RGB
if size(n)(2) == 3
  gimg = rgb2gray(img);
endif

% Defining filter properties
filter_size = (uint8)(input("Filter Size: "));
if mod(filter_size, 2) == 0 || filter_size == 1 % Sanity Check
  disp("[ERROR] Incorrect Filter Size, Terminating Program.");
  return;
endif
filter_mask = (uint8)(zeros(filter_size, filter_size));

% Padding image before applying filter
padding_size = (double)(filter_size - 1);
padded_gimg = (uint8)(zeros(n(1) + padding_size, n(2) + padding_size));
padded_gimg(padding_size/2 + 1 : n(1) + (padding_size/2), padding_size/2 + 1 : n(2) + (padding_size/2)) = gimg;

% Applying filter
disp("[STATUS] Applying filter...");
min_filtered_gimg = (uint8)(zeros(n(1), n(2)));
max_filtered_gimg = (uint8)(zeros(n(1), n(2)));
median_filtered_gimg = (uint8)(zeros(n(1), n(2)));
for i = 1 : n(1)
  for j = 1 : n(2)
    filter_mask = padded_gimg(i : i + filter_size - 1, j : j + filter_size - 1);
    min_val = min(min(filter_mask));
    max_val = max(max(filter_mask));
    %median_val = median(reshape(filter_mask, filter_size*filter_size, 1));
    min_filtered_gimg(i, j) = min_val;
    max_filtered_gimg(i, j) = max_val;
    %median_filtered_gimg(i, j) = median_val;
  endfor
endfor
disp("[STATUS] Done!");

% Displaying results
subplot(2, 2, 1), imshow(gimg), title("Original");
subplot(2, 2, 2), imshow(min_filtered_gimg), title("Min Filter");
subplot(2, 2, 3), imshow(max_filtered_gimg), title("Max Filter");
%subplot(2, 2, 4), imshow(median_filtered_gimg), title("Median Filter");