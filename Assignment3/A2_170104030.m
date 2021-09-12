clc;
%reading the image 
I = rgb2gray(imread('peppers.png'));
[row, col] = size(I);
sigma= input('Enter the sigma value: ');


m = 7;
k = floor(m/2) + 1;

kernel= zeros(m,m);      
sum_k= 0;                    
for i= 1:m
    for j= 1:m
        a = -((i-k).^2+ (j-k).^2);
        b = 2*pi*sigma*sigma;
        c = 1/b;
        d = c*exp((a)/(2*sigma*sigma));
        kernel(i,j) = d;
        sum_k = sum_k + kernel(i,j);
    end
end
kernel = kernel/sum_k;


output = I;


for i = 1:row-(m-1)
   for j = 1:col-(m-1) 
      t = I(i:i+(m-1), j:j+(m-1));
      t = double(t);
      filt = t.*kernel;
      output(i+floor(m/2),j+floor(m/2)) = sum(filt(:));
    end
end

 
output = uint8(output);
 
figure;
imshow(I), title('Input Image');
figure;
imshow(output), title('Output Image');
imwrite(output, 'output image.png');





