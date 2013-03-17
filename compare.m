mu(1) = sqrt(0.113992794840676);
mu(2) = sqrt(0.114074881039617);

N=100;
for m=1:10000
    v1 = randn(N,1);
    v2 = randn(N,1);
    v3 = randn(N,1);
    x1 = randn(1)*mu(1); % mu2(1)
    x2 = randn(1)*mu(2); % mu2(1)
    x3 = randn(1)*mu(1); % mu2(2)

    w1(m) = var(v1-x1*v2);
    w2(m) = var(v1-x2*v2 - (x1*(1+x2))*c);
end

y1=mean(sqrt(w1))
y1=mean(sqrt(w2))
