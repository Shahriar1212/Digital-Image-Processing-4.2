clc;
f = figure('WindowState','maximized');

% -------- Step 1: Taking Imput Image -----------
I = imread("Image1.jpg");
I = im2double(I);
out1 = I;

subplot(2, 4, 1);
imshow(out1, []);
title('Figure (a)');



% -------- Step 2: Applying Laplacian Filter -----------
laplacian_filter = [0 1 0; 1 -4 1; 0 1 0];
out2 = imfilter(I, laplacian_filter);

subplot(2, 4, 2);
imshow(out2, []);
title('Figure (b)');

% -------- Step 3: Laplacian Enhanced Image -----------
out3 = out1 - out2;


subplot(2, 4, 3);
imshow(out3);
title('Figure (c)');


% -------- Step 4: Applying Sobel Filter -----------
gx = [-1 0 1; -2 0 2; -1 0 1];
gy = [1 2 1; 0 0 0; -1 -2 -1];
d_dx = imfilter(I, gx);
d_dy = imfilter(I, gy);
out4 = sqrt(d_dx .^ 2 + d_dy .^ 2);
threshold = 0.5;

[row, col] = size(out4);
for i = 1 : row
    for j = 1 : col
        if(out4 < threshold)
            out4(i, j) = 0;
        end
    end
end

subplot(2, 4, 4);
imshow(out4);
title('Figure (d)');

% -------- Step 5: Applying Average Filter -----------
avg_filter_mask = ones([5 5]) / 25;
out5 = imfilter(out4, avg_filter_mask);

subplot(2, 4, 5);
imshow(out5);
title('Figure (e)');

% -------- Step 6: product of step(3) and (5). -----------
out6 = out3 .* out5;

subplot(2, 4, 6);
imshow(out6);
title('Figure (f)');

% -------- Step 7: Adding step(1) and step(6)). -----------
out7= I + out6;

subplot(2, 4, 7);
imshow(out7);
title('Figure (g)');

% -------- Step 8: Applying Power Law Transform -----------
c= 1;
gamma_value = 0.5;
out8 = c* power(out7, gamma_value);

subplot(2, 4, 8);
imshow(out8);
title('Figure (h)');


figure; imshow(out1, []); title('Figure (a)');
figure; imshow(out2, []); title('Figure (b)');
figure; imshow(out3); title('Figure (c)');
figure; imshow(out4); title('Figure (d)');
figure; imshow(out5); title('Figure (e)');
figure; imshow(out6); title('Figure (f)');
figure; imshow(out7); title('Figure (g)');
figure; imshow(out8); title('Figure (h)');


saveas(f,'Output','jpg');








