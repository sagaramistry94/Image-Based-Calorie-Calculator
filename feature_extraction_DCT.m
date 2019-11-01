function meanVector=feature_extraction_DCT(final)
    %final = im2double(final);
    R = rgb2gray(final);
    A = dct2(R);
    [rows,cols] = size(R);
    meanVector = zeros(rows,1);
    for i=1:rows
        for j=1:cols
            if(A(i,j)<0)
                A(i,j) = -A(i,j);
            end
            meanVector(i) = meanVector(i)+A(i,j);
        end
    end
    return;
end