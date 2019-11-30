img=imread('baboon.jpg');
gimg=rgb2gray(img);
[xdim, ydim] = size(gimg);
s=(double)(input("Enter the size of filter:")3);
exp_size = floor(s/2);

y = zeros(xdim, ydim);

% Pad image with zeros
X = [ zeros(exp_size, ydim+2*exp_size) ;
    zeros(xdim, exp_size) gimg zeros(xdim, exp_size) ;
    zeros(exp_size, ydim+2*exp_size) ];

% pass sXs median filter through image
med = zeros(s,s);
med2 = zeros(s*s,1);
med_pos = ceil(s*s/2);
for i = 1 : xdim
    for j = 1 : ydim
        med = gimg(i : i+s-1, j : j+s-1);
        med2 = sort(med(:));
        y(i,j) = med2(med_pos);
    end
end


