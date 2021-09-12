clc;
figure('WindowState','maximized');
a = 1;
img1 = imread('f1.png');
img2 = imread('f2.png');
img3 = imread('f3.png');
img4 = imread('f4.png');
img5 = imread('f5.png');

for i = 1:5
    %-----reading original images-------
    
    if (i == 1)
        out1 = img1;
    elseif (i == 2)
        out1 = img2;
    elseif (i == 3)
        out1 = img3;
    elseif (i == 4)
        out1 = img4;
    elseif (i == 5)
        out1 = img5;
    end
    
    %-------------binary image---------------
    out2 = imbinarize(rgb2gray(out1));
    
    %-------------- Palm ----------------------
    se = strel('disk',40);
    erode = imerode(out2, se);  %erosion
    dilated = imdilate(erode, se);    %Dilation
    out3 = dilated;
    
    %-------------- fingers(noisy)-------------
    out4 = out2 - out3;
    
    
    %----------------- fingers(noiseless)--------------
    removed_object = bwareaopen(out4, 500);  %Remove small objects 
    fill_tiny_hole = imfill(removed_object, 'holes');    %fill tiny holes
    doubled_img = double(fill_tiny_hole);
    without_noise = imgaussfilt(doubled_img);
    out5 = without_noise;
   
    %--------------Number of fingers --------------
    [img,out6] = bwlabel(out5);
    
    
    subplot(5,6,a);
    imshow(out1);
    title('Original');
    a = a + 1;
    
    subplot(5,6,a);
    imshow(out2);
    title('Binary Image');
    a = a + 1;
    
    subplot(5,6,a);
    imshow(out3);
    title('Palm');
    a = a + 1;
    
    subplot(5,6,a);
    imshow(out4);
    title('Fingers(Noisy)');
    a = a + 1;
    
    subplot(5,6,a);
    imshow(out5);
    title('Fingers(Noiseless)');
    a = a + 1;
    
    subplot(5,6,a);
    text(0.5, 0.5, int2str(out6));
    xticks([]);
    yticks([]);
    title('Number of Fingers');
    a = a + 1;
    
    
end
    