function meanVector=feature_extraction(final)
    
A = rgb2gray(final);

N = 64;  % Length of Walsh (Hadamard) functions
hadamardMatrix = hadamard(N);

HadIdx = 0:N-1;                          % Hadamard index
M = log2(N)+1;                           % Number of bits to represent the index

binHadIdx = fliplr(dec2bin(HadIdx,M))-'0'; % Bit reversing of the binary index
binSeqIdx = zeros(N,M-1);                  % Pre-allocate memory
for k = M:-1:2
    % Binary sequency index
    binSeqIdx(:,k) = xor(binHadIdx(:,k),binHadIdx(:,k-1));
end
SeqIdx = binSeqIdx*pow2((M-1:-1:0)');    % Binary to integer sequency index
walshMatrix = hadamardMatrix(SeqIdx+1,:); % 1-based indexing

temp  = 64;

D = zeros(temp,temp);

for i = 1:temp
     for j = 1:temp
         for k = 1:temp
            D(i,j) = D(i,j) + walshMatrix(i,k)*double(A(k,j));
         end
     end
end

C = zeros(temp,temp);
for i = 1:temp
     for j = 1:temp
         for k = 1:temp
            C(i,j) = C(i,j) + D(i,k)*walshMatrix(k,j);
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