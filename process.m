function mean_Vector=process(coord,im)

[rows cols] = size(coord);

for x=1:rows
        y=2;
        upperBoundary = coord(x,y);
        lowerBoundary = coord(x,y+2)-upperBoundary;
        leftBoundary = coord(x,y+1);
        rightBoundary = coord(x,y+3)-leftBoundary;
     
        temp = imcrop(im,[leftBoundary upperBoundary rightBoundary lowerBoundary]);
        final = imresize(temp, [64 64]);
        mean_Vector=feature_extraction_DWT(final);
        imshow(final);
        
        if x==1
            break;
        end
end
return;
end

