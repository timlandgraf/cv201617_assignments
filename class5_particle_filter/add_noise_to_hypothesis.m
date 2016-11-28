function [ Q ] = add_noise_to_hypothesis( L, s )
try 
    Q.p1 = L.p1 + s*randn(1,2);
    Q.p2 = L.p2 + s*randn(1,2);
catch 
    L
    s
end
end

