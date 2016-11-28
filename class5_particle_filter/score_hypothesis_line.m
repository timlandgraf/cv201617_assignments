function [L, q] = score_hypothesis_line(I, L)
q = improfile(I, [L.p1(1) L.p2(1)], [L.p1(2) L.p2(2)] );
L.weight = mean(q);
if isnan(L.weight) 
    L.weight = 0;
end
end

