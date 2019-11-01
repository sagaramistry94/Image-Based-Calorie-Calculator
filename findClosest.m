function itemCode=findClosest(meanVector)

values = xlsread('ItemsValue.xlsx');
[rows,cols] = size(values);

for i = 1:cols
    sum = 0;
    j = 1:rows-1
    difference = meanVector(j)-values(j,i);
    sqOfDiff = difference*difference;
    sum = sum + sqOfDiff;
    comparison(i) = sqrt(sum); 
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

return;
end