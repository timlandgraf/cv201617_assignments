function [ Q ] = get_mean_hypothesis( P )
N = length(P);
Q = P{1};
for i = 2 : N
    Q.p1 = Q.p1 + P{i}.p1;
    Q.p2 = Q.p2 + P{i}.p2;
end

Q.p1 = Q.p1 / N;
Q.p2 = Q.p2 / N;

end

