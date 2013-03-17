% Sample the binary sum distribution
clear all;
N_max = 17;
[V,P,C] = binary_sum_distribution(N_max);

for N=2:N_max
    N
    m = N;

    K = 1000;

    for k = 1:K
        M = zeros(N-1,1);

        for j=1:N-1
            % Sample N-j elements from f[j](x)
            x = rand(N-j,1);

            v = V{j}(1) * (x<=C{j}(1));
            for i = 2:length(C{j})
                v = v + V{j}(i) * (x<=C{j}(i)).*(x>C{j}(i-1));
            end
            M(j) = max(abs(v));
        end
        MM(N,k) = max(abs(M));
        NN(N,k) = N;
    end
end
y = (2:N_max).^(2);
loglog(NN(:),MM(:),'ok',2:N_max,y,'-b')
