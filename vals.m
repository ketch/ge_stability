clear all;
close all;

M = 10000;
x = zeros(M,1);
y = zeros(M,1);
N = 100;

for m=1:M
    %A = -1 + 2*rand(N);
    A = randn(N);
    [L,U,P] = lu(A);
    x(m)=abs(U(1,1));
    y(m)=abs(U(2,2));
    z(m)=abs(U(3,3));
    w(m)=abs(U(10,10));
end
hist(x,round(sqrt(M)));
figure
hist(y,round(sqrt(M)));
figure
hist(z,round(sqrt(M)));
figure
hist(w,round(sqrt(M)));
