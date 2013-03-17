clear all;
N = 256;
M = 10000;

for k = 1:N-1
    m = N+1-k;
    alpha = sqrt(2*log(m*sqrt(2/pi)));
    W = alpha*sqrt(1-2*log(alpha)/(1+alpha^2));
    mu2(k) = 1/W^2 * (1-(sqrt(2/pi)*W*exp(-W^2/2))/(erf(W/sqrt(2))));
end

for i = 1:M
    A1 = randn(N,1); A2 = randn(N,1); A3 = randn(N,1); 
    l21 = sqrt(mu2(1))*randn(1);
    l31 = sqrt(mu2(1))*randn(1);
    l32a = sqrt(mu2(2))*randn(1);
    l32 = sqrt(mu2(2))*randn(1);

    val0(i) = std(A3 + l32a*A2 + l31*(1+l32a)*A1);
    val(i) = std(A3 + l32a*A2 + l31*(1+l32a)*A1);
    val2(i) = std(A3 + l32a*A2 + l31*A1);

    % Why do these two give the same answer?
    valb(i) = std(l31*(1+l32)*A1);
    valc(i) = std(l31*A1);

    % When these two do not give the same answer?
    vald(i) = var(l31*(1+l32)*A1);
    vale(i) = var(l31*A1);
    x(i) = l31;
end
mean(valb)-mean(valc)
mean(vald)-mean(vale)
mu2(1)*mu2(2)
hist(x,sqrt(M))
%mean(val2)
%sqrt(1+mu2(1)+mu2(2))
%sqrt(1+mu2(1)+mu2(2)+mu2(1)*(1+sqrt(mu2(2))^2))
