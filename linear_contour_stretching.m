%Initializing
img = imread('baboon.jpg');
gimg = rgb2gray(img);
new_gimg = gimg;

%Defining Contour Limits
a = double(min(min(gimg)));
b = double(max(max(gimg)));
c = (double)(input('New Lower Limit: '));
d = (double)(input('New Upper Limit: '));

%Defining Scale Factor
f = (d - c)/(b - a);

%Stretching Contour
new_gimg = ((new_gimg - c) * f) + c;

%Displaying Results
subplot(1, 2, 1), imshow(gimg)
subplot(1, 2, 2), imshow(new_gimg)