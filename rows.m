% Study distributions of rows of U
% This gives a different distribution than what I calculated for the 2nd row!
% Very puzzling...

clear all
N = 10;
m = 20;
v = zeros(m,N-1);
for i = 1:m
    A = -1 + 2*rand(N);
    [L,U,P] = lu(A);
    v(i,:) = U(2,2:end);

    i1 = find(P(1,:));  %This row of A is first row of U
    i2 = find(P(2,:));

    max(abs(A(i2,:)-A(i2,1)/A(i1,1) * A(i1,:) - U(2,:)));

    B = 0*A;
    [Y,I] = max(abs(A(:,1)));
    for j = 1:N
        B(j,:) = A(j,:) - A(j,1)/A(I,1) * A(I,:);
    end
    [Y,J] = max(abs(B(:,2)));
    max(abs(U(2,2:end)- B(J,2:end)))

end
hist(v(:),100);
%[Y,I] = max(U(:))
%I/N
%for i = 9000:N
%    v = U(i,i:end);
%    hist(v,100); title(i); xlim([-100,100]);
%    pause;
%end
