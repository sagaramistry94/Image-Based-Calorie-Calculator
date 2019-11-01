A = imread('C:\Anirudh Mundra\B.E.ing Project\Final Project\Pictures\Training\Apple/Test_Apple_7.jpg');
A = rgb2gray(A);
[rows,cols] = size(A);
for i = 2:rows-1
    for j = 2:cols-1
        B(i,j) = double(A(i-1,j-1)+A(i,j-1)+A(i+1,j-1)+A(i-1,j)+A(i,j)+A(i+1,j)+A(i-1,j+1)+A(i,j+1)+A(i+1,j+1))/9;
    end
end
imshow(A);
        