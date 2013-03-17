clear all
N = 64;
m = 5000;
x = zeros(m,1);
for i = 1:m
    A = randn(N);
    [L,U,P] = lu(A);
    x(i) = L(4,3)*L(3,2)*L(2,1);
end
hist(x,sqrt(m))
figure
y = randn(m,1); z = randn(m,1); zz = randn(m,1);
hist(y.*z.*zz,sqrt(m));
%var(y.*z)
%var(x)
%var(v)*var(w)
