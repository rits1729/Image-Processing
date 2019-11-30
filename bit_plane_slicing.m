%Initializing
img = imread('baboon.jpg');
gimg = rgb2gray(img);
n = size(gimg);
b = (uint8)(zeros(n(1), n(2), 8));

%Bit Plane Slicing
for p = 1 : 8
  b(:, :, p) = bitand(gimg, 2^(p - 1));
endfor

%Displaying Results
for p = 1 : 5
  subplot(3, 3, p), imshow((logical(b(:, :, p))))
endfor
for p = 6 : 8
  subplot(3, 3, p), imshow(b(:, :, p))
endfor
subplot(3, 3, 9), imshow(gimg)

%Checking Results
reconstructed_gimg = (uint8)(zeros(n(1), n(2)));
for p = 1: 8
  reconstructed_gimg = reconstructed_gimg + b(:, :, p);
endfor
difference = reconstructed_gimg - gimg;
max_difference = max(max(difference));
min_difference = min(min(difference));
if max_difference == 0 && min_difference == 0
  disp("Result: OK");
else
  disp("Result: ERROR");
endif
