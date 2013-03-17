function [V,P,C] = binary_sum_distribution(N)
 %function [V,P,C] = binary_sum_distribution(N)
% Compute distributions resulting from summing the binary distribution
% which returns +/- 1 with equal probability of either.

V{1} = [-1,1];
P{1} = [0.5,0.5];
C{1} = cumsum(P{1});

for n = 2:N
    num_prev = length(V{n-1}); % # of values in previous line
    vals = [];
    ps   = [];
    k = 0;
    for i = 1:num_prev
        for j = i:num_prev
            val = V{n-1}(i) + V{n-1}(j);
            prob = P{n-1}(i) * P{n-1}(j);
            if prob<1.e-15  % I shouldn't do this, because these could still accumulate
                continue
            end
            if j~=i
                prob = prob*2;
            end
            x = find(vals==val);
            if length(x)==0
                k = k+1;
                vals(k) = val;
                ps(k)   = prob;
            else
                ps(x)   = ps(x) + prob;
            end
        end
    end
    V{n} = vals;
    P{n} = ps;
    C{n} = cumsum(P{n});
end
