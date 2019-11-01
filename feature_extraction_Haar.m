function meanVector=feature_extraction_Haar(final)
    A = rgb2gray(final);
    n=64;
    a=1/sqrt(n);
    for i=1:n
        H(1,i)=a;
    end
    for k=1:n-1
        p=fix(log2(k));
        q=k-2^p+1;
        t1=n/2^p;
        sup=fix(q*t1);
        mid=fix(sup-t1/2);
        inf=fix(sup-t1);
        t2=2^(p/2)*a;
        for j=1:inf
            H(k+1,j)=0;
        end
        for j=inf+1:mid
            H(k+1,j)=t2;
        end
        for j=mid+1:sup
            H(k+1,j)=-t2;
        end
        for j=sup+1:n
            H(k+1,j)=0;
        end
    end
    
    temp  = 64;

    D = zeros(temp,temp);

    for i = 1:temp
         for j = 1:temp
             for k = 1:temp
                D(i,j) = D(i,j) + H(i,k)*double(A(k,j));
             end
         end
    end

    C = zeros(temp,temp);
    for i = 1:temp
         for j = 1:temp
             for k = 1:temp
                C(i,j) = C(i,j) + D(i,k)*H(k,j);
             end
         end
    end
    meanVector =zeros(temp,1);
    for i = 1:temp
        z = 0;
         for j = 1:temp
             if(C(i,j)<0)
                 C(i,j) = -C(i,j);
             end
                z = z + C(i,j);
         end
         meanVector(i) = z/64;
    end
    return;
end