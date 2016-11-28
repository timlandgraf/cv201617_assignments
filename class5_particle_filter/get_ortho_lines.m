function Q = get_ortho_lines(L, len, dis)
v       = L.p2 - L.p1;
v_len   = norm(v);
r1      = len * [v(2) -v(1)] / v_len;
r2      = -r1;
n       = floor(v_len / dis);

P1 = [];
P2 = [];
for i = 1 : n
    P1 = [P1; L.p1 + r1 + i*dis*v/v_len];
    P2 = [P2; L.p1 + r2 + i*dis*v/v_len];
end
Q.P1 = P1;
Q.P2 = P2;
end