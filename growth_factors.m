% Reproduce Figure 22.1 of Trefethen & Bau
%
% For Normal distribution, 1/2 law
% For uniform distribution, 2/3 law
N = 500;
rho = zeros(N,1);

for n = 1:N
    %A = randn(n);
    A = -1 + 2*rand(n);
    [L,U] = lu(A);
    %rho(n) = max(abs(U(:)))/max(abs(A(:)));
    rho(n) = max(abs(U(:)));%/max(abs(A(:)));
end
%y = (1:N).^(2/3);
y = (1:N).^(1/2);
loglog(1:N,rho,'ok',1:N,y,'-b')
