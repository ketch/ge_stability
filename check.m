% This script confirms that MATLAB's LU decomposition does what I believe it to do.
N=1000;
A = -1 + 2*rand(N);
[L,U,P] = lu(A);

i1 = find(P(1,:));  %This row of A is first row of U
i2 = find(P(2,:));

max(abs(A(i2,:)-A(i2,1)/A(i1,1) * A(i1,:) - U(2,:)))
