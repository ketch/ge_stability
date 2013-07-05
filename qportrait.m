%Generate a random lower-triangular matrix and look at its Q-portrait.
N = 1000;
A = rand(N);
L = tril(A,-1);
LI = L + eye(N);
[Q,R] = qr(LI);
spy(abs(Q)>0.1);
