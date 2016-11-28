function L = score_hypothesis_ortholines(I, L, len, dis)
Q = get_ortho_lines(L, len, dis);
N = size(Q.P1,1);
L.weight = 0;
for i = 1 : N
    p1 = Q.P1(i,:);
    p2 = Q.P2(i,:);
    q = improfile(I, [p1(1) p2(1)], [p1(2) p2(2)] );
    s = mean(q);
    if isnan(s) 
        s = 0;
    end    
    L.weight = L.weight + s;
end
L.weight = L.weight/N;
end






