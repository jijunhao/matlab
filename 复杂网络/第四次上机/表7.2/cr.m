n = 40;
A = zeros(n);
A(1,2)=1;A(2,5)=1;A(3,5)=1;
A(4,5)=1;A(5,[6,11])=1;A(7,8)=1;A(8,[9,11])=1;
A(9,10)=1;A(11,16)=1;A(12,16)=1;A(13,14)=1;
A(14,16)=1;A(15,16)=1;A(16,[17,20,21,22])=1;
A(18,20)=1;A(19,[20,28])=1;A(22,[23,25,26])=1;
A(23,24)=1;A(26,[27,28,31,38])=1;A(28,29)=1;
A(29,30)=1;A(31,[32,36])=1;A(32,[33,34])=1;
A(33,34)=1;A(34,35)=1;A(36,37)=1;A(38,[39,40])=1;
A = A+A';

crv = zeros(1,n);
tlv = zeros(1,n);
for i=1:n
    A_ = A;
    A_(i,:)=0;
    A_(:,i)=0;
    for j=1:n-1
        for k=j+1:n
            if dijkstra(A_,j,k)==Inf
                tlv(i) = tlv(i)+ 1/dijkstra(A,j,k);
            end
        end
    end
    crv(i) = 4*tlv(i)/((n-1)*(n+2));
end
crv