n = 13;
A = zeros(n);
A(1,[2,3])=1;A(2,[3,4])=1;A(3,4)=1;
A(4,5)=1;A(5,[6,10])=1;A(6,[7,8])=1;
A(7,[8,9])=1;A(8,9)=1;A(10,[11,12])=1;
A(11,[12,13])=1;A(12,13)=1;
A = A+A';
D = NaN(n);
B = A;
k = 1;
while any(isnan(D(:)))
    D(B>0 & isnan(D)) = k;
    k = k+1;
    B = B*A;
end
D=D-diag(diag(D));
ccv = zeros(1,n);
for i=1:n
    ccv(i) = (n-1)*1/sum(D(i,:));
end
ccv