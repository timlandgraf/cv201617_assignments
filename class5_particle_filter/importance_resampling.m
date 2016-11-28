function [ Q ] = importance_resampling( P, s )


% cumulative weights
C = zeros(1, length(P)+1);
for i = 1 : length(P)
    C(i+1) = C(i) + P{i}.weight;
end  

for i = 1 : length(P)
    % choose hypothesis with probability proportional to its weight
    thr = C(end) * rand();
    j = find(C <= thr, 1, 'last');

    Q{i} = add_noise_to_hypothesis(P{j}, s);
end

