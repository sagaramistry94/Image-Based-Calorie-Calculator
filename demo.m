values = xlsread('ItemsValue.xlsx');
meanVector =[1; 3; 5; 6; 8; 10; 12; 14; 15; 16];
[rows,cols] = size(values);

for i = 1:cols
    sum = 0;
    j = 1:rows-1
    difference = double(meanVector(j)-values(j,i));
    sqOfDiff(j) = difference.^2;
    for k=1:rows-1
        sum = sum + sqOfDiff(k);
    end
    comparison(i) = sum.^0.5; 
end


min = 50000;
index = 1;
for i = 1:cols
    if min < comparison(i)
        min = comparison(i);
        index = i;
    end
end

calorie = values(11,index);