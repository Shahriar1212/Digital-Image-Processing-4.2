A = uint8(imread('input2.jpg'));
B = uint8(imread('input1.jpg'));

[row, col, dim] = size(A);
C = uint8(ones(row,col));

r = ceil(col/6);
m = 1;
n = r;
for l = 1:6
    for i = 1:row
        for j = m:n
            if (mod(l,2) == 0)
                C(i,j) = A(i,j); 
            end
            
            if (mod(l,2) == 1)
                C(i,j) = B(i,j); 
            end
        end
    end
    m = n;
    n = n+r;
end

figure; imshow(C);
imwrite(C, 'output.jpg');