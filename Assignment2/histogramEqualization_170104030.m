clc;

% a reading image
I = imread('cameraman.png');
imshow(I);

% b computing number of pixels
[row, col]= size(I);

% histogram of original image
hist1= zeros(1, 256);
for i= 1:row
    for j= 1:col
       temp=I(i,j)+1;
       hist1(temp)= hist1(temp)+1;
    end
end

% c computing pdf
pdf= ((hist1/row*col));

% d computing cdf
cdf = zeros(1, 256);
cdf(1)= pdf(1);
for i= 2:256    
    cdf(i)= cdf(i-1) + pdf(i);
end


% e,f multiplying with l-1 and rounding cdf 
cdf = round((255/(row*col))*cdf); 
% cdf = round(255*cdf); 

eqalized_image = zeros(1, 256);
for i= 1:row                                        
    for j= 1:col                                     
        temp1= (I(i,j)+1);                              
        eqalized_image(i,j)= cdf(temp1);                            
    end                                             
end

% histogram of new image
hist2 = zeros(1, 256);
for i= 1:row
    for j= 1:col
      temp2= eqalized_image(i,j)+1;
      hist2(temp2)= hist2(temp2)+1;

    end
end

% g,h displaying image and histogram
subplot(2,2,1);
imshow(uint8(I)), title('Original Image');
subplot(2,2,3);
imshow(uint8(eqalized_image)), title('Equalized Image');
subplot(2,2,2);
bar(hist1);
subplot(2,2,4);
bar(hist2);
