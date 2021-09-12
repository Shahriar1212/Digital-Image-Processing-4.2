clear;

% a. Read an image
I = imread('pollen.jpg');

[row,col] = size(I);

%histogram of orginal image 
hist1=zeros(1,256);
for i=1:row
    for j=1:col
        temp=I(i,j)+1;
        hist1(temp)=hist1(temp)+1;
    end
end

I = im2double(I);

% b. find minimum pixel value of image I
A = min(I(:));

% c. find maximum pixel value of image I
B = max(I(:));

% d. difference of B and A
D = B-A;
% d. highest possible intensity
M = (2^8 - 1);

% e. Contrast Stretching
R = I;
for i=1:row
    for j=1:col
        a = I(i,j)-A;
        b = a/D;
        c = b*M;
        d = c+A;
        R(i,j) = d;
    end
end
R = uint8(R);

%histogram plot of streched image
hist2=zeros(1,256);
for i=1:row
    for j=1:col
        temp=R(i,j)+1;
        hist2(temp)=hist2(temp)+1;
    end
end

% f,e. Display image and distogram
subplot(2,2,1), imshow(I), title('Before Contrast Stretching') 
subplot(2,2,2), bar(hist1), title('Histogram') 
subplot(2,2,3), imshow(R), title('After Contrast Stretching') 
subplot(2,2,4), bar(hist2), title('Histogram')
