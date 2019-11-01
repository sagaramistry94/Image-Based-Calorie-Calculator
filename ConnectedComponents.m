clear all;
clc;
for item=1:10
    path = 'C:\Anirudh Mundra\B.E.ing Project\Final Project\Pictures\Testing\Bread/Test_Bread_';
    path1 = strcat(path, num2str(item));
    path2 = strcat(path1, '.jpg');
A = imread(path2);
thres = graythresh(A);
C = im2bw(A, thres);

[row, col] = size(C);
rows = row+2;
cols = col+2;

for i=1:rows
    for j = 1:cols
        newImg(i,j) = 0;
    end
end

for i=2:rows-1
    for j=2:cols-1
        newImg(i,j) = C(i-1,j-1);
    end
end

index = 1;

for i=2:rows-1
    for j=2:cols-1
        if newImg(i,j) == 0
            newImg(i,j) = index;
            index = index+1;
        else
            newImg(i,j) = 0;
        end
    end
end

for times=1:5
    for i=2:rows-1
        for j=2:cols-1
            if newImg(i,j)~=0 
                if newImg(i,j-1) < newImg(i,j) && newImg(i,j-1)~=0 
                    newImg(i,j) = newImg(i,j-1);
                end
                if newImg(i,j+1) < newImg(i,j) && newImg(i,j+1)~=0 
                    newImg(i,j) = newImg(i,j+1);
                end
                if newImg(i-1,j) < newImg(i,j) && newImg(i-1,j)~=0 
                    newImg(i,j) = newImg(i-1,j);
                end
                if newImg(i+1,j) < newImg(i,j) && newImg(i+1,j)~=0
                    newImg(i,j) = newImg(i+1,j);
                end

                if newImg(i-1,j-1) < newImg(i,j) && newImg(i-1,j-1)~=0 
                    newImg(i,j) = newImg(i-1,j-1);
                end
                if newImg(i-1,j+1) < newImg(i,j) && newImg(i-1,j+1)~=0 
                    newImg(i,j) = newImg(i-1,j+1);
                end
                if newImg(i+1,j-1) < newImg(i,j) && newImg(i+1,j-1)~=0 
                    newImg(i,j) = newImg(i+1,j-1);
                end
                if newImg(i+1,j+1) < newImg(i,j) && newImg(i+1,j+1)~=0
                    newImg(i,j) = newImg(i+1,j+1);
                end
            end
        end
    end
    
    for i=rows-1:-1:2
        for j=cols-1:-1:2
            if newImg(i,j)~=0 
                if newImg(i,j-1) < newImg(i,j) && newImg(i,j-1)~=0 
                    newImg(i,j) = newImg(i,j-1);
                end
                if newImg(i,j+1) < newImg(i,j) && newImg(i,j+1)~=0 
                    newImg(i,j) = newImg(i,j+1);
                end
                if newImg(i-1,j) < newImg(i,j) && newImg(i-1,j)~=0 
                    newImg(i,j) = newImg(i-1,j);
                end
                if newImg(i+1,j) < newImg(i,j) && newImg(i+1,j)~=0
                    newImg(i,j) = newImg(i+1,j);
                end

                if newImg(i-1,j-1) < newImg(i,j) && newImg(i-1,j-1)~=0 
                    newImg(i,j) = newImg(i-1,j-1);
                end
                if newImg(i-1,j+1) < newImg(i,j) && newImg(i-1,j+1)~=0 
                    newImg(i,j) = newImg(i-1,j+1);
                end
                if newImg(i+1,j-1) < newImg(i,j) && newImg(i+1,j-1)~=0 
                    newImg(i,j) = newImg(i+1,j-1);
                end
                if newImg(i+1,j+1) < newImg(i,j) && newImg(i+1,j+1)~=0
                    newImg(i,j) = newImg(i+1,j+1);
                end
            end
        end
    end
end 

uniq = unique(newImg);
[dim] = size(uniq);
count = 0;

for x=2:dim
    for i=1:rows
        for j=1:cols
            if newImg(i,j) == uniq(x)
                count = count+1;
            end
        end
    end
    count_uniq(x,1) = uniq(x);
    count_uniq(x,2) = count;
    count = 0;
end

sum = 0;
for i=1:dim
    sum = sum+count_uniq(i,2);
end
avg = sum/dim(1,1);

countOfObjects = 1;

for i=1:dim
    if count_uniq(i,2) > avg
        final_objects(countOfObjects,1) = count_uniq(i,1);
        final_objects(countOfObjects,2) = count_uniq(i,2);
        countOfObjects = countOfObjects+1;
    end
end

for x=1:countOfObjects-1
    flag = 0;
    for i=1:rows
        for j=1:cols
            if newImg(i,j) == final_objects(x,1)
                coord(x,2) = i;
                coord(x,1) = final_objects(x,1);
                flag = 1;
                break;
            end
        end
        if flag == 1
            break;
        end
    end
end
            
for x=1:countOfObjects-1
    flag = 0;
    for j=1:cols
        for i=1:rows
            if newImg(i,j) == final_objects(x,1)
                coord(x,3) = j;
                coord(x,1) = final_objects(x,1);
                flag = 1;
                break;
            end
        end
        if flag == 1
            break;
        end
    end
end

for x=1:countOfObjects-1
    flag = 0;
    count = 0;
    for i=1:rows
        for j=1:cols
            if newImg(i,j) == final_objects(x,1)
                count = count+1;
            end
            if count == final_objects(x,2)
                coord(x,4) = i;
                coord(x,1) = final_objects(x,1);
                flag = 1;
                break;
            end
        end
        if flag == 1
            break;
        end
    end
end

for x=1:countOfObjects-1
    flag = 0;
    count = 0;
    for j=1:cols
        for i=1:rows
            if newImg(i,j) == final_objects(x,1)
                count = count+1;
            end
            if count == final_objects(x,2)
                coord(x,5) = j;
                coord(x,1) = final_objects(x,1);
                flag = 1;
                break;
            end
        end
        if flag == 1
            break;
        end
    end
end

feature=process(coord,A);

for i=1:10
    final_feature(i, item) = feature(i,1);
end
end