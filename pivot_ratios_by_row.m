clear all;
%for m = 1:1000
N = 1000;
A = -1 + 2*rand(N);
A = sign(A);
[L,U,P] = lu(A);

plot(abs(sum(L(:,1:10)')'),'ok');
hold on;
%end
%hold off
