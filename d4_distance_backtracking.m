%Initialization
img = imread('baboon.jpg');
gimg = rgb2gray(img);
img_path_trace = img;
n = size(gimg);

visited = zeros(n);

global q;
global rear;
q(1).x = -1;
q(1).y = -1;
rear = 0;

distance = 0;

THRESH = 256; %Threshold value for binarization of the test image

for i = 1 : n(1)
  for j = 1 : n(2)
    if gimg(i, j) < THRESH
      visited(i, j) = true;
    else
      visited(i, j) = false;
    endif
  endfor
endfor

%Endpoint Inputs
src.x = input("Source Row: ");
src.y = input("Source Column: ");
dest.x = input("Destination Row: ");
dest.y = input("Destination Column: ");

%Sanity Check
if src.x > n(1) || src.x < 1 || src.y > n(2) || src.y < 1 || dest.x > n(1) || dest.x < 1 || dest.y > n(2) || dest.y < 1
  disp("ERROR: Invalid coorindates, terminating application...");
  return; 
endif
if visited(src.x, src.y) == true
  disp("ERROR: Source cannot be traversed from...");
  return;
elseif visited(dest.x, dest.y) == true
  disp("ERROR: Destination cannot be traversed to...");
  return;
endif

%Stack Functions
function push(i)
  global rear;
  global q;
  rear = rear + 1;
  q(rear) = i;
endfunction

function res = pop()
  global rear;
  global q;
  if empty()
    res.x = -1;
    res.y = -1
    return;
  else
    res = q(rear);
    rear = rear - 1;
    return;
  endif
endfunction

function res = empty()
  global rear;
  if rear == 0
    res = true;
    return;
  else
    res = false;
    return;
  endif
endfunction

%Distance Calculation
current.x = src.x;
current.y = src.y;
visited(current.x, current.y) = true;
push(current);
while !empty()
  current = q(rear);
  %Early Termination Criteria
  if current.x == dest.x && current.y == dest.y
    break;
  %Priority Movement
  elseif current.x < dest.x && !visited(current.x + 1, current.y)
    current.x = current.x + 1;
    distance = distance + 1;
    visited(current.x, current.y) = true;
    push(current);
  elseif current.x > dest.x && !visited(current.x - 1, current.y)
    current.x = current.x - 1;
    distance = distance + 1;
    visited(current.x, current.y) = true;
    push(current);
  elseif current.y < dest.y && !visited(current.x, current.y + 1)
    current.y = current.y + 1;
    distance = distance + 1;
    visited(current.x, current.y) = true;
    push(current);
  elseif current.y > dest.y && !visited(current.x, current.y - 1)
    current.y = current.y - 1;
    distance = distance + 1;
    visited(current.x, current.y) = true;
    push(current);
  %Random Movement
  elseif current.x + 1 <= n(1) && !visited(current.x + 1, current.y)
    current.x = current.x + 1;
    distance = distance + 1;
    visited(current.x, current.y) = true;
    push(current);
  elseif current.x - 1 >= 1 && !visited(current.x - 1, current.y)
    current.x = current.x - 1;
    distance = distance + 1;
    visited(current.x, current.y) = true;
    push(current);
  elseif current.y + 1 <= n(2) && !visited(current.x, current.y + 1)
    current.y = current.y + 1;
    distance = distance + 1;
    visited(current.x, current.y) = true;
    push(current);
  elseif current.y - 1 >= 1 && !visited(current.x, current.y - 1)
    current.y = current.y - 1;
    distance = distance + 1;
    visited(current.x, current.y) = true;
    push(current);
  %Backtracking
  else
    distance = distance - 1;
    pop();
  endif
endwhile

%Displaying Results
if distance == -1
  disp("Error: No path possible");
else
  %Binarizing image based on threshold
  for i = 1 : n(1)
    for j = 1 : n(2)
      if gimg(i, j) < THRESH
        img_path_trace(i, j, 1) = 0;
        img_path_trace(i, j, 2) = 0;
        img_path_trace(i, j, 3) = 0;
      else
        img_path_trace(i, j, 1) = 255;
        img_path_trace(i, j, 2) = 255;
        img_path_trace(i, j, 3) = 255;
      endif
    endfor
  endfor
  %Drawing Path
  for i = 1 : rear
    if i == 1
      img_path_trace(q(i).x, q(i).y, 1) = 0;
      img_path_trace(q(i).x, q(i).y, 2) = 255;
      img_path_trace(q(i).x, q(i).y, 3) = 0;
    elseif i == rear
      img_path_trace(q(i).x, q(i).y, 1) = 0;
      img_path_trace(q(i).x, q(i).y, 2) = 0;
      img_path_trace(q(i).x, q(i).y, 3) = 255;
    else
      img_path_trace(q(i).x, q(i).y, 1) = 255;
      img_path_trace(q(i).x, q(i).y, 2) = 0;
      img_path_trace(q(i).x, q(i).y, 3) = 0;
    endif
  endfor
  path_display = input("Do you want to see the path coordinates? (Y/N): ", 's');
  if path_display == "Y" || path_display == "y"
    disp("START");
    for i = 1 : rear
      fprintf("(%d, %d)\n", q(i).x, q(i).y);
    endfor
    disp("END");
  endif
  fprintf("D4 Distance: %d\n", distance);
  imshow(img_path_trace);
endif