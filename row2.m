% Study distributions of values after first elimination
% This gives the distribution I calculated, which is different from what I get from MATLAB's LU.
clear all
N = 1000;
m = 50;
v = zeros(m,N-1);
for i = 1:m
    A = -1 + 2*rand(N);
    B = 0*A;
    [Y,I] = max(abs(A(:,1)));
    for j = 1:N
        B(j,:) = A(j,:) - A(j,1)/A(I,1) * A(I,:);
    end
    [Y,J] = max(abs(B(:,2)));  % Change B to A here to get the distribution I expected!
                                % Or just consider all rows!
    v(i,:) = B(J,2:end);
end
hist(v(:),100);

