% Perform Gaussian elimination on a matrix, computing variance of remaining matrix
% at each step.

clear all;
close all;
tic
N = 256;
M = 10;
for ii = 1:M  % conduct experiment M times
A = randn(N);
pred(1) = 1;
pred2(1) = 1;
for k = 1:N-1
    submat = A(k:end,k:end);
    sd(ii,k) = std(submat(:));

    m = N+1-k;

    alpha = sqrt(2*log(m*sqrt(2/pi)));
    W = alpha*sqrt(1-2*log(alpha)/(1+alpha^2));
    mu2(k) = 1/W^2 * (1-(sqrt(2/pi)*W*exp(-W^2/2))/(erf(W/sqrt(2))));

    pred(k+1) = 1;
    for kk = 0:k-1
        pred(k+1) = pred(k+1) + mu2(k-kk)*prod(1+mu2(k-kk+1:k))*2/pi;
    end
    %pred(k+1) = prod(1+mu2(1:k)); Naive
    %pred(k+1) = pred(k) + sum(cumprod(mu2)); WRONG
    pred2(k+1) = pred2(k) + mu2(k);  % Trefethen

    [Y,I] = max(abs(A(k:end,k)));  % Find pivot
    I = I + k - 1;
    temp = A(k,:); A(k,:) = A(I,:); A(I,:) = temp; % swap rows

    % This vectorized version is faster for larger matrices:
    col = A(k+1:end,k)/A(k,k);
    A(k+1:end,k:end) = A(k+1:end,k:end) - col*A(k,k:end);

    % This loop version is faster for smaller matrices:
    %for j = k+1:N %This can be vectorized
    %    A(j,:) = A(j,:) - A(j,k)/A(k,k) * A(k,:);
    %end
end
end
sd = mean(sd,1);
plot(1:N-1,sd,'ok',1:N,sqrt(pred2),'b-',1:N,sqrt(pred2),'r-')
toc
sd(2)
